function [] = plot_pitch(filepath, win_size, hop_size, min_lag, max_lag)
% Compute and plot pitch estimates for unbiased autocorrelation function and for yin.
%
% Parameters
% ----------
% filepath : string
%   path to .wav file
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
% None
[x_t, fs] = audioread(filepath);
t = linspace(0, length(x_t)/fs, length(x_t));
[pitch_acf, t_pitch_acf] = detect_pitch_acf(x_t', t, fs, win_size, hop_size, min_lag, max_lag);
figure('Name', extractAfter(filepath, '/'));
subplot(2, 1, 1);
plot(t_pitch_acf, pitch_acf, '.k');
title('ACF plot');
xlabel('Time');
ylabel('Frequency');
[pitch_yin, t_pitch_yin] = detect_pitch_yin(x_t', t, fs, win_size, hop_size, min_lag, max_lag);
subplot(2, 1, 2);
plot(t_pitch_yin, pitch_yin, '.k');
title('YIN plot');
xlabel('Time');
ylabel('Frequency');
end