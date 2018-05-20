function [x_t, fs, t] = import_audio(filepath)
% Import an audio signal from a wave file.
%
% Parameters
% ----------
% filepath : string
% path to a .wav file
%
% Returns
% -------
% x_t : 1 x T array
% time domain signal
% t : 1 x T array
% time points in seconds
% fs : int
% sample rate (samples per second)

% Read audio signal
[x_t, fs] = audioread(filepath);

% Discard second channel
x_t = transpose(x_t(:,1));

% Calculate time in seconds
t = linspace(0, length(x_t)/fs, length(x_t));
end