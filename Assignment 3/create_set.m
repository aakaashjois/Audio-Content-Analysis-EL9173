function [features, labels] = create_set(fpath1, fpath2, params)
% Compute features and parameters for training data.
%
% Parameters
% ----------
% fpath1: string
%   full path to audio file with training data from class 1
% fpath2: string
%   full path to audio file with training data from class 2
% params: struct
%   Matlab structure with fields are win size, hop size,
%   min freq, max freq, num mel filts, n dct, the parameters
%   needed for computation of MFCCs
%
% Returns
% -------
% features: NF x NE matrix
%   matrix of training/testing set features (NF is number of
%   features and NE is number of feature instances)
% labels: 1 x NE array
%   vector of training/testing labels (class numbers) for each instance
%   of features

% Obtain the MFCC for first sample
[mfccs1, ~] = compute_mfccs(fpath1, params.win_size, params.hop_size, ...
    params.min_freq, params.max_freq, params.num_mel_filts, params.n_dct);
% Generate labels as 1 for first samples
labels1 = ones(1, length(mfccs1));
% Obtain the MFCC for second sample
[mfccs2, ~] = compute_mfccs(fpath2, params.win_size, params.hop_size, ...
    params.min_freq, params.max_freq, params.num_mel_filts, params.n_dct);
% Generate labels as 2 for second samples
labels2 = ones(1, length(mfccs2)) * 2;
features = [mfccs1 mfccs2];
labels = [labels1 labels2];
end