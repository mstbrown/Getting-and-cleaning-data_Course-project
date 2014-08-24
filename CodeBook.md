 A code book that describes:
 1. the variables, 
 2. the data, and 
 3. the transformations that I performed to clean up the data.
 
 "1". The variables for my tidy dataset come from the 
 Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide 
 Anguita. November 2012 database. There are 68 variables
 copied in those original authors' naming convention such 
 that: "t" denotes a time domain signal; "Body" or "Gravity" 
 denotes the acceleration signal type; "Acc" or "Gyro" denotes 
 signals from the accelerometer or gyroscope; if applicable, 
 "Jerk" or "Mag" denote time to obtain a jerk signal or 
 magnitute of the signal; "mean():" or "std()" represent the 
 Mean value or Standard deviation; and if applicable, "X," "Y," 
 or "Z" denote the direction of the signal.
 
 This naming convention leads to the original author's naming
 pattern:
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

I have subsetted the authors' original dataset to include only
two variables that were estimated from these signals, specifically: 
mean(): Mean value
std(): Standard deviation

"2". the input data and accompanying descriptions for this dataset 
are the following files which must be moved to the working 
directory in R:
X_test.txt 
X_train.txt
y_test.txt 
y_train.txt
subject_test.txt
subject_train.txt

the output data for this dataset is a tidy dataset named
"tidy_data.txt". The variables in the tidy dataset are in
the following units as quoted by the original authors':
"The features selected for this database come from the accelerometer 
and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time 
domain signals (prefix 't' to denote time) were captured at a constant 
rate of 50 Hz. Then they were filtered using a median filter and a 3rd 
order low pass Butterworth filter with a corner frequency of 20 Hz to 
remove noise. Similarly, the acceleration signal was then separated 
into body and gravity acceleration signals (tBodyAcc-XYZ and 
tGravityAcc-XYZ) using another low pass Butterworth filter with a 
corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were 
derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these 
signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
indicate frequency domain signals)." 
These signals were used to estimate the variables described in "1. 
The variables..." above.

"3". the transformations that I performed to clean up the data. The 
tidy dataset departs from the original authors' database in the following
ways:
"1".	I have merged the training and the test sets to create one data set.
"2".	I have extracted only the measurements on the mean and standard 
    deviation for each measurement. 
"3".	I used descriptive activity names to name the activities in the 
    data set
"4".	I appropriately labeled the data set with descriptive variable names. 
"5".	As described in "2. the output data..." above, my script titled
    "run_analysis.R" creates a second, independent tidy data set with the 
    average of each variable for each activity and each subject. 
