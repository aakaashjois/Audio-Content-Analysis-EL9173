function [n_t_sf , t_sf, fs_sf] = compute_novelty_sf(x_t, t, fs, win_size, hop_size)
% Compute spectral flux novelty function.
%
% Parameters
% ----------
% x_t : 1 x T array
%   time domain signal
% t : 1 x T array
%   time points in seconds
% fs : int
%   sample rate of x_t (samples per second)
% win_size : int
%   window size (in samples)
% hop_size : int
%   hop size (in samples)
%
% Returns
% -------
% n_t_sf : 1 x L array
%   novelty function
% t_sf : 1 x L array
%   time points in seconds
% fs_sf : float
%   sample rate of novelty function

% Calculate spectrogram with Hamming window
[X, ~, ~]=spectrogram(x_t,hamming(win_size), win_size-hop_size, win_size, fs);
[rows, ~] = size(X);

% Shift by 1 index to the right
X_shift = [zeros(rows, 1) X(:, 1:end-1)];

% Half wave rectification
x = (abs(X) - abs(X_shift));
H = (x + abs(x))/2;
n_t_sf = mean(H, 1);

% Calculate time in seconds
t_sf = linspace(0, t(end), length(n_t_sf));

% Calculate sampling frequency
fs_sf = fs / hop_size;
end