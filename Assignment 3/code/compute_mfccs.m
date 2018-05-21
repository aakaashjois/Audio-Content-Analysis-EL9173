function [mfccs, fs_mfcc] = compute_mfccs(filepath, win_size, hop_size, ...
    min_freq, max_freq, num_mel_filts, n_dct)
% Compute MFCCs from audio file.
%
% Parameters
% ----------
% filepath : string
%   path to .wav file
% win size : int
%   spectrogram window size (samples)
% hop size : int
%   spectrogram hop size (samples)
% min_freq : float
%   minimum frequency in Mel filterbank (Hz)
% max_freq : float
%   maximum frequency in Mel filterbank (Hz)
% num_mel_filts: int
%   number of Mel filters
% n_dct: int
%   number of DCT coefficients
%
% Returns
% -------
% mfccs : n_dct-1 x NT array
%     MFCC matrix (NT is number spectrogram frames)
% fs_mfcc : int
%     sample rate of MFCC matrix (samples/sec)

% Read audio file
[y, Fs] = audioread(filepath);
% Compute spectrogram for audio file
[S, F, ~] = spectrogram(y, hamming(win_size), win_size - hop_size, ...
    win_size, Fs);
min_mel = hz2mel(min_freq);
max_mel = hz2mel(max_freq);
% Find the Mel center frequencies in Hz
cf_hz = mel2hz(linspace(min_mel, max_mel, num_mel_filts+2));
% Create the Mel filterbank
cf_dif = diff(cf_hz);
slopes = bsxfun(@minus, cf_hz, F)';
mel_pwr_spect = zeros(num_mel_filts, length(F));
for i = 1:num_mel_filts
    upward_slope = -slopes(i,1:end) / cf_dif(i);
    downward_slope = slopes(i+2,1:end) / cf_dif(i+1);
    mel_pwr_spect(i,1:length(upward_slope)) = bsxfun(@max, 0, ...
        bsxfun(@min, upward_slope, downward_slope));
end
% Normalize the Mel filterbank so that each filter sums to 1
mel_pwr_spect = mel_pwr_spect .* (2.0 ./ (cf_hz(3:num_mel_filts+2) ...
    - cf_hz(1:num_mel_filts)))';
% Find the Mel power spectrum
mel_pwr_spect = 20 * log10(mel_pwr_spect * (abs(S).^2));
% Take DCT
mfccs = dct(mel_pwr_spect);
% Truncate MFCC to n_dct values and remove the first row
mfccs = mfccs(2:n_dct, 1:end);
% Normalize the MFCC such that sum of all values is 1
% mfccs = mfccs ./ sum(mfccs(:));
% Find sample rate of MFCC
fs_mfcc = Fs / hop_size;
end