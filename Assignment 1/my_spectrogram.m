function [S, F, T] = my_spectrogram(x, window, noverlap, nfft, fs)
pad = zeros(1, length(window)/2);
x = [pad, x];
x_buff = buffer(x, nfft, noverlap, 'nodelay');
basis_mat = dftmtx(nfft);
S = [];
for x_col = x_buff
    S_DFT = basis_mat * x_col;
    S_DFT = S_DFT(1:length(S_DFT)/2 + 1);
    S = [S S_DFT];
end
[~, cols] = size(S);
F = 0:fs/nfft:fs/2;
T = linspace(0, 1, cols);
end