function [pitch, t_pitch] = detect_pitch_acf(x_t, t, fs, win_size, hop_size, min_lag, max_lag)
% Detect pitch using the unbiased autocorrelation function.
%
% Parameters
% ----------
% x_t : 1 x T array
%   time domain signal
% t: 1 x T array
%   time points in seconds
% fs : int
%   sample rate (samples per second)
% win_size : int
%   window size (in samples)
% hop_size : int
%   hop size (in samples)
% min_lag : int
%   minimum possible lag value (in samples)
% max_lag : int
%   maximum possible lag value (in samples)
%
% Returns
% -------
% pitch : 1 x P array
%   detected pitch values (Hz)
% t_pitch : 1 x P array
%   time points in seconds

splits = buffer(x_t, win_size, win_size - hop_size);
[~, cols] = size(splits);
pitch = [];
t_pitch = t(end) / cols: t(end) / cols: t(end);

for col = 1: cols
    max = 0;
    max_count = 0;
    for lag = min_lag: max_lag
        N = win_size - lag - 1;
           temp = (1/N) * splits(1: N + 1, col)' * splits(lag: N + lag, col);
           if temp > max
               max = temp;
               max_count = lag;
           end
    end
    pitch = [pitch (1 / max_count) * fs];
end