function [onset_a, onset_t, n_t_smoothed, thresh] = onsets_from_novelty(n_t, t, fs, w_c, medfilt_len, offset)
% Peak pick a novelty function.
%
% Parameters
% ----------
% n_t : 1 x L array
%   novelty function
% t : 1 x L array
%   time points of n_t in seconds
% fs : float
%   sample rate of n_t (samples per second)
% w_c : float
%   cutoff frequency for Butterworth filter (Hz)
% medfilt_len : int
%   Length of the median filter used in adaptive threshold. (samples)
% offset : float
%   Offset in adaptive threshold.
%
% Returns
% -------
% onset_a : 1 x P array
%   onset amplitudes
% onset_t : 1 x P array
%   time values of detected onsets (seconds)
% n_t smoothed : 1 x L array
%   novelty function after smoothing.
% thresh : 1 x L array
% adaptive threshold.

% Apply low pass first order Butterworth filter
[b, a] = butter(1, w_c / fs, 'low');
n_t_smoothed = filtfilt(b, a, n_t);

% Normalize between 0 and 1
norm = (n_t_smoothed - min(n_t_smoothed)) / (max(n_t_smoothed) - min(n_t_smoothed));

% Adaptive thresholding
thresh = offset + medfilt1(norm, medfilt_len);

% Thresholding the signal
I = norm<thresh;
thresholded = norm;
thresholded(I) = -Inf;

% Peak picking
[onset_a, onset_t] = findpeaks(thresholded, t);
end