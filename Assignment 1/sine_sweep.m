function x_t = sine_sweep(f_min, f_max, fs, duration, a)
% Generate a sine sweep.
%
% Parameters
% ----------
% f min : float
% minimum frequency (Hz)
% f max : float
% maximum frequency (Hz)
% fs : int
% sample rate (samples per second)
% duration : float
% length of sweep (seconds)
% a : float
% amplitude
%
% Returns
% -------
% x t : 1 x T array
% time domain signal
x_t = a*sin(cumsum((2*pi*logspace(log10(f_min), log10(f_max), fs*duration)/fs)));
end
