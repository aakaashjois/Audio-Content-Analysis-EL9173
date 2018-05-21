# Assignment 4

## Pitch Detection

The pitch of the audio file is estimated using two different methods.

##### 1. Short-term unbiased auto-correlation function

![](https://latex.codecogs.com/svg.latex?%5Clarge%20r_x%28l%29%20%3D%20%5Cfrac%7B1%7D%7BN-l%7D%5Csum_%7Bn%3D0%7D%5E%7BN-1-l%7Dx%28n%29x%28n&plus;l%29)

The estimated pitch is the one which maximizes the detection function within the specified range of lags.

##### 2. YIN

![](https://latex.codecogs.com/svg.latex?%5Clarge%20d%28l%29%20%3D%20%5Csum_%7Bn%3D0%7D%5E%7BN-1-l%7D%28x%28n%29%20-%20x%28n&plus;l%29%29%5E2)

![](https://latex.codecogs.com/svg.latex?%5Clarge%20%5Chat%7Bd%7D%28l%29%20%3D%20%5Cleft%5C%7B%5Cbegin%7Bmatrix%7D%201%20%26%20l%3D0%20%5C%5C%20%5Cfrac%7Bd%28l%29%7D%7B%5Cfrac%7B1%7D%7Bl%7D%5Csum_%7Bu%3D1%7D%5E%7Bl%7Dd%28u%29%7D%20%26%20otherwise%20%5Cend%7Bmatrix%7D%5Cright.)

The estimated pitch is the one which minimizes the detection function within the specified range of lags.

The following parameters are used for pitch detection:

*Window size* = *2048*

*Hop size* = *256*

*Minimum lag* = *15*

*Maximum lag* = *800*

### Results

##### 1. Audio: jazz2REF

![](./results/jazz2REF.jpg)

##### 2. Audio: T08-violin

![](./results/T08-violin.jpg)

### Inference

When comparing the ACF and YIN detection functions, we can clearly observe large octave error produced in ACF technique. While YIN does have octave error, it is significantly lesser than ACF. We can also see that, for silences in audio, ACF generates a lot of noise while YIN just gets a very high frequency value.

### Exploring parameters

*Window size* = *2048*

*Hop size* = *512*

*Minimum lag* = *30*

*Maximum lag* = *400*

##### 1. Audio: jazz2REF

![](./results/jazz2REF-enhanced.jpg)

##### 2. Audio: T08-violin

![](./results/T08-violin-enhanced.jpg)

When using these parameters, we can observe the reduction in the noise of both the pitch detection functions. The octave error has been reduced and detected pitch is cleaner and easier to read. The small steps in the change of pitch value can also be observed easily than with the default parameters. With these new parameters, we can even observe the small modulation to the pitch of the violin sound which can be heard when playing the audio.