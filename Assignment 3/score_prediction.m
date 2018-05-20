function [overall_accuracy, per_class_accuracy] = ...
score_prediction(test_labels, predicted_labels)
% Compute the confusion matrix given the test labels and predicted labels.
%
% Parameters
% ----------
% test_labels: 1 x NE array
%   array of ground truth labels for test data
% predicted_labels: 1 x NE test array
%   array of predicted labels
%
% Returns
% -------
% overall_accuracy: scalar
%   The fraction of correctly classified examples.
% per_class_accuracy: 1 x 2 array
%   The fraction of correctly classified examples
%   for each instrument class.
%   perclass accuracy[1] should give the value for
%   instrument class 1, per class accuracy[2] for
%   instrument class 2, etc.

diff = bsxfun(@minus, test_labels, predicted_labels);
overall_accuracy = nnz(~diff) / length(test_labels);

ind = find((test_labels) - 1, 1, 'first');
diff1 = bsxfun(@minus, test_labels(1:ind-1), predicted_labels(1: ind-1));
class_1_acc = nnz(~diff1) / length(test_labels(1:ind-1));
diff2 = bsxfun(@minus, test_labels(ind:end), predicted_labels(ind: end));
class_2_acc = nnz(~diff2) / (length(test_labels(ind: end)));
per_class_accuracy = [class_1_acc class_2_acc];
end
