function [] = create_novelty_plots(filepath, win_size, hop_size, w_c, medfilt_len, offset) % ground truth filepath)
% Plot waveform, novelty functions, preprocessing steps, and onsets.
%
% Parameters
% ----------
% filepath : string
%   path to a .wav file
% win_size : int
%   window size for novelty function (in samples)
% hop_size : int
%   hop size for novelty function (in samples)
% w_c : float
%   peak picking cutoff frequency for Butterworth filter (Hz)
% medfilt_len : int
%   peak picking length of the median filter used in adaptive threshold. (samples)
% offset : float
%   peak picking offset in adaptive threshold.
%
% Returns
% -------
% None

%%
% Import audio file
[x_t, fs, t] = import_audio(filepath);

% Plot audio waveform
subplot(311);
plot(t, x_t);
title('Waveform');
grid();
legend('Audio signal');
xlabel('Time(s)')
xlim([0 t(end)])

% Compute log energy novelty function
[n_t_le , t_le, fs_le] = compute_novelty_le(x_t, t, fs, win_size, hop_size);

% Peak picking on log energy novelty function
[onset_a, onset_t, n_t_smoothed, thresh] = onsets_from_novelty(n_t_le, t_le, fs_le, w_c, medfilt_len, offset);

% Plot log energy novelty function with peaks
subplot(312);
plot(t_le, n_t_le, '-r');
hold on;
plot(t_le, n_t_smoothed, '-k');
plot(t_le, thresh, ':b');
plot(onset_t, onset_a, 'o', 'Color', 'k')
xlim([0 t_le(end)])
grid();
leg = legend('Novelty function', 'Smoothed novelty function', 'Adaptive thresholding', 'Detected onsets');
set(leg,'color','none');
xlabel('Time(s)')
title('Log Energy Novelty Function')
hold off;

% Compute spectral flux novelty function
[n_t_sf , t_sf, fs_sf] = compute_novelty_sf(x_t, t, fs, win_size, hop_size);

% Peak picking on spectral flux novelty function
[onset_a, onset_t, n_t_smoothed, thresh] = onsets_from_novelty(n_t_sf, t_sf, fs_sf, w_c, medfilt_len, offset);

% Plot spectral flux novelty function with peaks
subplot(313);
plot(t_sf, n_t_sf, '-r');
hold on;
plot(t_sf, n_t_smoothed, '-k');
plot(t_sf, thresh, ':b');
plot(onset_t, onset_a, 'o', 'Color', 'k')
xlim([0 t_sf(end)])
grid();
leg = legend('Novelty function', 'Smoothed novelty function', 'Adaptive thresholding', 'Detected onsets');
set(leg,'color','none');
xlabel('Time(s)')
title('Spectral Flux Novelty Function')
hold off;
end