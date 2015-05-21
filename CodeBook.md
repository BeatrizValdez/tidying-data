Dataset : tydyData
===================
This dataset includes 88 variables and 180 observations. This information was originally collected from  an experiment 
carried out by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, and  Luca Oneto  at Smartlab - Non Linear Complex 
Systems Laboratory, called ** Human Activity Recognition Using Smartphones Dataset** . In this experiment, 30 volunteers 
between 19 and 48 years old performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. This information was captured using special apparata and split
into a two set of data: training data and a test data. A set of variables were estimated from these features:

## Features: 

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Variables estimated:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

From the original features I have selected only  the measurements on the mean and standard deviation for each feature.

##Work Performed to obtain 'tidyData'
To created the dataset 'tidyData', I:

1. Load the three text files available  in the two directories: train and test, as well as the files 'features.txt' and 'activity_ labels.
2. merged the activities from test and train set and gave descriptive names to those activities
3. joined information about subjects from both train and test set
4. joined the information from subjects and from the activities
5. joined the train and test datasets
6.  gave names to the dataset created in step 5 using the second column from 'feature.txt', and adding 'subject' and 'activity'
7. selected only those measurement related to the mean and standard deviation with function grep().
8. subset the dataset created in step 6
9. removed some characteres from the names of the variables. These had previously set to lower cases
10. transformed variables 'activity' and 'subject' into factors
11.  grouped by 'subject' and 'activity' and sumarizing 
 each column by mean, using packages dplyr, tidyr and magrittr.



