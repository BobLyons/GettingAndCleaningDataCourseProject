# Introduction
This is the code book for the tidy_data.txt data set, which was produced by the run_analysis.R script.

The run_analysis.R script produces the tidy_data.txt data set from the following source data, which was collected from the accelerometers and gyroscopes of the Samsung Galaxy S smartphone: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

At a high level, the run_analysis.R script produces the tidy_data.txt data set as follows:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Columns

This section documents the columns of the tidy_data.txt data set. This section has a separate subsection for each column. The heading of each subsection is the column name followed by the data type of the column in parentheses. 

Regarding columns tBodyAcc.mean.X through fBodyBodyGyroJerkMag.std, inclusive:

These columns correspond to a subset of the features of the source data set (namely, the features whose feature names contain 'mean(' or 'std('). The feature names of the source data set are not valid R variable names; thus, the column names for the tidy_data.txt data set are a transformation of the feature names of the source data set. See the run_analysis.R script for details.

Each of these columns (tBodyAcc.mean.X through fBodyBodyGyroJerkMag.std) is the average value for the activity and subject. Specifically, it's the average of the values of the corresponding feature of the source data set (for the activity and subject).

## activity (chr)  
The activity, the valid values of which are as follows: "STANDING", "SITTING", "LAYING", "WALKING", "WALKING_UPSTAIRS", and "WALKING_DOWNSTAIRS".

## subject (int)  
An integer identifying the subject performing the activity.

## tBodyAcc.mean.X (num)
## tBodyAcc.mean.Y (num)
## tBodyAcc.mean.Z (num)
## tBodyAcc.std.X (num)
## tBodyAcc.std.Y (num)
## tBodyAcc.std.Z (num)
## tGravityAcc.mean.X (num)
## tGravityAcc.mean.Y (num)
## tGravityAcc.mean.Z (num)
## tGravityAcc.std.X (num)
## tGravityAcc.std.Y (num)
## tGravityAcc.std.Z (num)
## tBodyAccJerk.mean.X (num)
## tBodyAccJerk.mean.Y (num)
## tBodyAccJerk.mean.Z (num)
## tBodyAccJerk.std.X (num)
## tBodyAccJerk.std.Y (num)
## tBodyAccJerk.std.Z (num)
## tBodyGyro.mean.X (num)
## tBodyGyro.mean.Y (num)
## tBodyGyro.mean.Z (num)
## tBodyGyro.std.X (num)
## tBodyGyro.std.Y (num)
## tBodyGyro.std.Z (num)
## tBodyGyroJerk.mean.X (num)
## tBodyGyroJerk.mean.Y (num)
## tBodyGyroJerk.mean.Z (num)
## tBodyGyroJerk.std.X (num)
## tBodyGyroJerk.std.Y (num)
## tBodyGyroJerk.std.Z (num)
## tBodyAccMag.mean (num)
## tBodyAccMag.std (num)
## tGravityAccMag.mean (num)
## tGravityAccMag.std (num)
## tBodyAccJerkMag.mean (num)
## tBodyAccJerkMag.std (num)
## tBodyGyroMag.mean (num)
## tBodyGyroMag.std (num)
## tBodyGyroJerkMag.mean (num)
## tBodyGyroJerkMag.std (num)
## fBodyAcc.mean.X (num)
## fBodyAcc.mean.Y (num)
## fBodyAcc.mean.Z (num)
## fBodyAcc.std.X (num)
## fBodyAcc.std.Y (num)
## fBodyAcc.std.Z (num)
## fBodyAccJerk.mean.X (num)
## fBodyAccJerk.mean.Y (num)
## fBodyAccJerk.mean.Z (num)
## fBodyAccJerk.std.X (num)
## fBodyAccJerk.std.Y (num)
## fBodyAccJerk.std.Z (num)
## fBodyGyro.mean.X (num)
## fBodyGyro.mean.Y (num)
## fBodyGyro.mean.Z (num)
## fBodyGyro.std.X (num)
## fBodyGyro.std.Y (num)
## fBodyGyro.std.Z (num)
## fBodyAccMag.mean (num)
## fBodyAccMag.std (num)
## fBodyBodyAccJerkMag.mean (num)
## fBodyBodyAccJerkMag.std (num)
## fBodyBodyGyroMag.mean (num)
## fBodyBodyGyroMag.std (num)
## fBodyBodyGyroJerkMag.mean (num)
## fBodyBodyGyroJerkMag.std (num)
