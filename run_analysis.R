#R script completed in partial fufillment of the Getting and Cleaning Data 
  #Course Project

#optional step: clearing the workspace
rm(list = ls())

#setting the working directory
setwd("C:/Users/Owner/Dropbox/Fall2014/Getting_and_Sorting_Data") #Note: this 
#working directory must be adjusted to match the file location on the computer 
  #in use.
#important step: the data downloaded from the Coursera page are in multiple
  #folders. The first step is to move two datasets into the working directory.
  #Those two datasets are: X_test.txt and X_train.txt (Note: later steps will call
  #for moving additional files into the working directory)

#From Coursera, Requirement 1. "Merges the training and the test sets to create 
  #one data set."
#My method will be to load in the first dataset and then add in the second
  #read in the first dataset
data1<-read.table("X_test.txt", header=FALSE,sep="") 
#add in the second dataset
data2<-rbind(data1,read.table("X_train.txt",header=FALSE,sep=""))

#From Coursera, Requirement 2. "Extracts only the measurements on the mean 
  #and standard deviation for each measurement." 
#My method was to open the features.txt file in MS Excel in order to determine
  #which features contained mean and standard deviation measurements. Then I
  #eliminate all the other columns. 
#Based on Week 1 Lecture, "Components of a Tidy Dataset," I will describe in 
  #detail how I used MS Excel: 
  #1.Open Excel and in Excel choose open and then select "all files" from the 
    #dropdown box. Then open the "features.txt" file from the UCI HAR Dataset
  #2.In Excel's cell B1 enter the following code: =ISNUMBER(SEARCH("mean()",A1))
    #and then extend that code from cells B2:B561
  #3.In cell C1 enter the following code: =ISNUMBER(SEARCH("std()",A1))      and
    #then extend that code from cells C2:C561
  #4.In cell D1 enter the following code: =IF(OR(B1=TRUE,C1=TRUE),ROW(A1))   and
    #then extend that code from cells D2:D561
  #5.In cell E1 enter the following code: =D1&"," and then extend that code from
    #cells E2:E560. For cell E561 enter the following code: =D561
  #6.Select cells E1:E561. Then right-click cell H1 and select "Paste Special"
    #in the Paste Special options select "Values" and "Transpose." The cells you
    #pasted (H1:UU1) will be highlighted. Copy these cells and paste them directly
    #into R. That has been done below (within the c() command):
mean_std<-c(1,  2,	3,	4,	5,	6,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	41,	42,	43,	44,	45,	46,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	81,	82,	83,	84,	85,	86,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	121,	122,	123,	124,	125,	126,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	161,	162,	163,	164,	165,	166,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	201,	202,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	214,	215,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	227,	228,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	240,	241,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	253,	254,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	266,	267,	268,	269,	270,	271,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	345,	346,	347,	348,	349,	350,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	424,	425,	426,	427,	428,	429,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	503,	504,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	516,	517,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	529,	530,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	542,	543,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE,	FALSE)
#eliminate all the other columns 
data3<-data2[c(mean_std)]

#From Coursera, Requirement 3. "Uses descriptive activity names to name the 
  #activities in the data set."
#My method is to use the activity names provided: walking, walking_upstairs,
  #walking_downstairs, sitting, standing, laying. First I convert the raw 
  #activities column to a descriptive version and second I bind in the 
  #descriptive version activity names
#important step: y_test.txt and y_train.txt must be added to the working directory
#reading in activities labels
activities<-rbind(read.table("y_test.txt",header=FALSE,sep=""),read.table("y_train.txt",header=FALSE,sep=""))
#converting activities names to descriptive version. Note: this could be done
  #with fewer lines of code, but the below works for sure, so I used it
activities[activities=="1"] <- "walking"
activities[activities=="2"] <- "walking_upstairs"
activities[activities=="3"] <- "walking_downstairs"
activities[activities=="4"] <- "sitting"
activities[activities=="5"] <- "standing"
activities[activities=="6"] <- "laying"
#binding in the raw activities column
data4<-cbind(activities,data3)

#From Coursera, Requirement 4. "Appropriately labels the data set with descriptive
  #variable names."
#My method is to label the columns in the dataframe. I copy the original authors'
  #naming convention such that: "t" denotes a time domain signal; "Body" or
  #"Gravity" denotes the acceleration signal type; "Acc" or "Gyro" denotes 
  #signals from the accelerometer or gyroscope; if applicable, "Jerk" or "Mag"
  #denote time to obtain a jerk signal or magnitute of the signal; "mean():" or
  #"std()" represent the Mean value or Standard deviation; and if applicable, 
  #"X," "Y," or "Z" denote the direction of the signal.
#labeling columns pasted in from MS Excel with the first column added to name
  #the rows of activity names. Process is to include only the mean and std names.
colnames(data4)<-c("activity-type",  "tBodyAcc-mean()-X",	"tBodyAcc-mean()-Y",	"tBodyAcc-mean()-Z",	"tBodyAcc-std()-X",	"tBodyAcc-std()-Y",	"tBodyAcc-std()-Z",	"tGravityAcc-mean()-X",	"tGravityAcc-mean()-Y",	"tGravityAcc-mean()-Z",	"tGravityAcc-std()-X",	"tGravityAcc-std()-Y",	"tGravityAcc-std()-Z",	"tBodyAccJerk-mean()-X",	"tBodyAccJerk-mean()-Y",	"tBodyAccJerk-mean()-Z",	"tBodyAccJerk-std()-X",	"tBodyAccJerk-std()-Y",	"tBodyAccJerk-std()-Z",	"tBodyGyro-mean()-X",	"tBodyGyro-mean()-Y",	"tBodyGyro-mean()-Z",	"tBodyGyro-std()-X",	"tBodyGyro-std()-Y",	"tBodyGyro-std()-Z",	"tBodyGyroJerk-mean()-X",	"tBodyGyroJerk-mean()-Y",	"tBodyGyroJerk-mean()-Z",	"tBodyGyroJerk-std()-X",	"tBodyGyroJerk-std()-Y",	"tBodyGyroJerk-std()-Z",	"tBodyAccMag-mean()",	"tBodyAccMag-std()",	"tGravityAccMag-mean()",	"tGravityAccMag-std()",	"tBodyAccJerkMag-mean()",	"tBodyAccJerkMag-std()",	"tBodyGyroMag-mean()",	"tBodyGyroMag-std()",	"tBodyGyroJerkMag-mean()",	"tBodyGyroJerkMag-std()",	"fBodyAcc-mean()-X",	"fBodyAcc-mean()-Y",	"fBodyAcc-mean()-Z",	"fBodyAcc-std()-X",	"fBodyAcc-std()-Y",	"fBodyAcc-std()-Z",	"fBodyAccJerk-mean()-X",	"fBodyAccJerk-mean()-Y",	"fBodyAccJerk-mean()-Z",	"fBodyAccJerk-std()-X",	"fBodyAccJerk-std()-Y",	"fBodyAccJerk-std()-Z",	"fBodyGyro-mean()-X",	"fBodyGyro-mean()-Y",	"fBodyGyro-mean()-Z",	"fBodyGyro-std()-X",	"fBodyGyro-std()-Y",	"fBodyGyro-std()-Z",	"fBodyAccMag-mean()",	"fBodyAccMag-std()",	"fBodyBodyAccJerkMag-mean()",	"fBodyBodyAccJerkMag-std()",	"fBodyBodyGyroMag-mean()",	"fBodyBodyGyroMag-std()",	"fBodyBodyGyroJerkMag-mean()",	"fBodyBodyGyroJerkMag-std()")

#From Coursera, Requirement 5. "Creates a second, independent tidy data set 
  #with the average of each variable for each activity and each subject." 
#My method will be to add in the subject identifiers and then compute the
  #averages for each of the 30 subjects within each of the 6 activities. This
  #amounts to 30x6=180 rows. Our course TA OKs that design here:
  #https://class.coursera.org/getdata-006/forum/thread?thread_id=236
#important step: subject_test.txt and subject_train.txt must be added to the 
  #working directory
#add in subject identifiers (and name that column)
subjects<-rbind(read.table("subject_test.txt",header=FALSE,sep=""),read.table("subject_train.txt",header=FALSE,sep=""))
colnames(subjects)<-"subject"
data5<-cbind(subjects,data4)
#compute the averages
data6<-aggregate(data5[,3:68], by=list(data5[,1],data5[,2]),mean)
#rename the first two columns
colnames(data6)[1]<-"subject"
colnames(data6)[2]<-"activity-type"
#Last step: create a tidy dataset
write.table(data6,"tidy_data.txt",row.name=FALSE)

#useful note, step 5 can be doublechecked by confirming that subsetting would
  #produce an identical result. For example, the third column of the first row
  #of the tidy dataset is the mean of tBodyAcc-mean()-X for the activity 
  #"laying" for the first subject (i.e. subject "1"). The code below can be
  #uncommented and run to produce 0.2215982, which is identical to the third 
  #column of the first row of the tidy dataset.
#subset<-subset(data5,subject==1&data5[2]=="laying",select="tBodyAcc-mean()-X")
#mean(subset[,1])

#useful note, to read in the data that was output in step 5 use the code below:
#data<-read.table("tidy_data.txt",header=TRUE,sep="")
