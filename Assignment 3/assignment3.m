% Initializing predefined values
piano_train = 'piano_train.wav';
piano_test = 'piano_test.wav';
trombone_train = 'trombone_train.wav';
trombone_test = 'trombone_test.wav';
trumpet_train = 'trumpet_train.wav';
trumpet_test = 'trumpet_test.wav';
params.win_size = 1024;
params.hop_size = 512;
params.min_freq = 86;
params.max_freq = 8000;
params.num_mel_filts = 40;
params.n_dct = 15;

% Classifying piano and trumpet
[train_features, train_labels] = create_set(piano_train, ...
    trumpet_train, params);
[test_features, test_labels] = create_set(piano_test, ...
    trumpet_test, params);

% Normalizing based on min and max of train features
a = min(train_features, [], 2);
b = max(train_features, [], 2);
train_features = train_features - a;
train_features = bsxfun(@rdivide, train_features, b - a);
test_features = test_features - a;
test_features = bsxfun(@rdivide, test_features, b - a);

predicted_labels = predict_labels(train_features, ...
    train_labels, test_features);
[overall_accuracy, per_class_accuracy] = score_prediction(test_labels, ...
    predicted_labels);
disp('Overall Accuracy for Piano and Trumpet = ')
disp(overall_accuracy)
disp('Per Class Accuracy for Piano and Trumpet = ')
disp(per_class_accuracy)

% Classifying Trombone and Trumpet
[train_features, train_labels] = create_set(trombone_train, ...
    trumpet_train, params);
[test_features, test_labels] = create_set(trombone_test, ...
    trumpet_test, params);

% Normalizing based on min and max of train features
a = min(train_features, [], 2);
b = max(train_features, [], 2);
train_features = train_features - a;
train_features = bsxfun(@rdivide, train_features, b - a);
test_features = test_features - a;
test_features = bsxfun(@rdivide, test_features, b - a);

predicted_labels = predict_labels(train_features, ...
    train_labels, test_features);
[overall_accuracy, per_class_accuracy] = score_prediction(test_labels, ...
    predicted_labels);
disp('Overall Accuracy for Trombone and Trumpet = ')
disp(overall_accuracy)
disp('Per Class Accuracy Trombone and Trumpet = ')
disp(per_class_accuracy)