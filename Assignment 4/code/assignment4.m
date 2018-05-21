%% Default Parameters
filepath = ["../audio/jazz2REF.wav", "../audio/T08-violin.wav"];
win_size = 2048;
hop_size = 256;
min_lag = 15;
max_lag = 800;
for file = filepath
    plot_pitch(file, win_size, hop_size, min_lag, max_lag);
end
%% Enhanced Parameters
filepath = ["../audio/jazz2REF.wav", "../audio/T08-violin.wav"];
win_size = 2048;
hop_size = 512;
min_lag = 30;
max_lag = 400;
for file = filepath
    plot_pitch(file, win_size, hop_size, min_lag, max_lag);
end