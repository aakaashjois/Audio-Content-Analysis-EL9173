function [n_t_le , t_le, fs_le] = compute_novelty_le(x_t, t, fs, win_size, hop_size)
% Compute log energy derivative novelty function.
%
% Parameters
% ----------
% x_t : 1 x T array
% time domain signal
% t : 1 x T array
% time points in seconds
% fs : int
% sample rate of x_t (samples per second)
% win_size : int
% window size (in samples)
% hop_size : int
% hop size (in samples)
%
% Returns
% -------
% n_t_le : 1 x L array
% novelty function
% t_le : 1 x L array
% time points in seconds
% fs_le : float
% sample rate of novelty function

% Pad signal initially with N/2 - 1 zeros
x = padarray(x_t', win_size/2 - 1, 'pre')';

% Create blocks of signal with overlap
x_buf = buffer(x, win_size, win_size - hop_size, 'nodelay');

% Create Hamming window matrix
wind = hamming(win_size);

% Compute log energy derivative function
n_t_le = diff(log(mean(bsxfun(@times, x_buf.^2, wind), 1)));

% Calculate time vector
[~, cols] = size(n_t_le);
t_le = linspace(0, t(end), cols);

% Calculate frequency
fs_le = fs / hop_size;
end