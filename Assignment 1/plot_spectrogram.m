function [] = plot_spectrogram(x_t, win_size, hop_size, win_type, fs, nfft)
% Calculate and plot the spectrogram of a time-domain audio signal.
%
% Parameters
% ----------
% x t : 1 x T array
%   time domain signal
% win size : int
%   window size (in samples)
% hop size : int
%   hop size (in samples)
% win type : str
%   window type (one of \texttt{`rect', `hamm', `black'})
% fs : int
%   sample rate (samples per second)
% nfft : int
%   fft length (in samples)
%
% Returns
% -------
% None

switch win_type
    case 'rect'
        window = rectwin(win_size);
    case 'hamm'
        window = hamming(win_size);
    case 'black'
        window = blackman(win_size);
end
% ;
[s, f, t] = spectrogram(x_t, window, hop_size, nfft, fs);
imagesc(t, f, 20*log10(abs(s)))
xlabel('Time(s)')
ylabel('Frequency(Hz)')
axis('xy')