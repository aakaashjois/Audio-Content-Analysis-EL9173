% Default parameters
f_min = 500.0;
f_max = 5000.0;
fs = 44100.0;
a = 0.95;
t = 1.0;
N = 128;
window_size = N;
hop_size = N/2;
window_type = 'rect';
nfft = N;
x_t = sine_sweep(f_min, f_max, fs, t, a);
%%
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
window_size = 256;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
window_size = 512;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
window_size = 1024;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
N = 256;
hop_size = N/4;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
N = 256;
hop_size = N/16;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
N = 256;
hop_size = N/32;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
window_size = N;
hop_size = N/2;
window_type = 'hamm';
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
window_type = 'black';
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
N = 256;
nfft = 2*N;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
N = 256;
nfft = 4*N;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
%%
N = 256;
nfft = 8*N;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
%%
N = 128;
window_size = N;
hop_size = N/2;
window_type = 'rect';
nfft = N;
plot_spectrogram(x_t, window_size, hop_size, window_type, fs, nfft);
[s, f, t] = my_spectrogram(x_t, rectwin(window_size), hop_size, nfft, fs);
imagesc(t, f, 20*log10(abs(s)))
xlabel('Time(s)')
ylabel('Frequency(Hz)')
axis('xy')