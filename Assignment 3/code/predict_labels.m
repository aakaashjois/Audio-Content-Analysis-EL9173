function predicted_labels = ...
    predict_labels(train_features, train_labels, test_features)
% Predict the labels of the test features,
% given training features and labels,
% using a nearest-neighbor classifier.
%
% Parameters
% ----------
% train_features: NF x NE train matrix
%   matrix of training set features (NF is number of
%   features and NE train is number of training feature instances)
% train_labels: 1 x NE train array
%   vector of labels (class numbers) for each instance
%   of train features
% test_features: NF x NE test matrix
%   matrix of test set features (NF is number of
%   features and NE test is number of testing feature instances)
%
% Returns
% -------
% predicted_labels: 1 x NE test array
%   array of predicted labels

products = test_features' * train_features;
[~, ind] = max(products, [], 2);
predicted_labels = train_labels(ind);
end