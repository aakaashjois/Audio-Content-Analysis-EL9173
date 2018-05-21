# Assignment 3

## Binary Classification

A spectrogram of the audio files are first obtained. Next, a Mel filterbank is created between a range of frequencies with a given number of filters using assymetric triangular windows. The Mel power spectrum in dB of the signals are then calculated using the Mel filterbank. Then, the DCT is calculated for each frequency bin and the first DCT coefficient is discarded. The rest of the DCT coefficients are then normalized to sum to one. This gives the MFCC of the audio files.

The following parameters are used to calculate the MFCC:

*Window size* = *1024*

*Hop size* = *512*

*Window type* = *Hamming*

*Minimum frequency* = *86*

*Maximum frequency* = *8000*

*Number of Mel filters* = *40*

*Number of DCT Coefficients* = *15*

The training and testing data is then created using these MFCCs. Next, a nearest neighbor classifier is used to classify the data. The nearest neighbor classifier will first compute the dot product between the feature vector corresponding to each sample in the testing data and all the feature vectors corresponding in the training data. Then the training feature vector with the largest dot product value is chosen and its label is assigned to the feature vector from the testing data. Based on the assigned labels, the overall accuracy and per class accuracy is calculated.

### Results

#### Piano vs Trumpet

Accuracy: 54.76%

##### Percentage of frames that are correctly classified per source class:
- Piano: 100%
- Trumpet: 6.45%

#### Trombone vs Trumpet

Accuracy: 66.75%

##### Percentage of frames that are correctly classified per source class:
- Trombone: 99.93%
- Trumpet: 36.10%

### Inference
If we observe the audio clips for the trumpet, we can identify few silence regions. The errors can be accounted for this region because silence regions are very hard to classify. When classifying, we should also take note of the reverberation. A slight reverberation can make an instrument’s features completely different to an algorithm. The human ear has been trained with lots of samples to easily identify reverberation and might not feel like a major change. We should also note that, the number of samples to train the classifier is low. A larger amount of data might give better results.