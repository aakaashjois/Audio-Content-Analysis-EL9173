%%
% Setting variables
win_size = 1024;
hop_size = 512;
w_c = 4;
medfilt_len = 8;
offset = 0.01;
%%
% Plot for 'PianoDebussy' audio file
filepath = 'PianoDebussy.wav';
create_novelty_plots(filepath, win_size, hop_size, w_c, medfilt_len, offset);
%%
% Plot for 'female_short' audio file
filepath = 'female_short.wav';
create_novelty_plots(filepath, win_size, hop_size, w_c, medfilt_len, offset);
%%
% Plot for 'sewing-machine_short' audio file
filepath = 'sewing-machine_short.wav';
create_novelty_plots(filepath, win_size, hop_size, w_c, medfilt_len, offset);