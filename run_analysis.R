# This script produces a tidy data set from the following source data, which was collected from the 
# accelerometers and gyroscopes of the Samsung Galaxy S smartphone:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# A full description is available at the site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The script assumes that the current working directory contains the 'UCI HAR Dataset'
# subdirectory, which was created by unzipping the following ZIP file:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# At a high level, this script produces the tidy data set as follows:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.  The independent tidy 
#    data set is in the tidy_data data frame, which is written to the tidy_data.txt file 
#    in the current working directory.

# The script writes the tidy_data independent tidy data set data set to the 'tidy_data.txt' 
# file in the current working directory. Also, when the script completes, the independent 
# tidy data set will be in the tidy_data data frame.

# Pull in the required libraries.
library('data.table')
library('dplyr')

# Read the 'UCI HAR Dataset/features.txt' file, which is a list of the features 
# in the X_test.txt and X_train.txt files. We filter the features, because we
# want only the feature names that contain 'mean(' or 'std('. The feature names
# are not valid R variable names. So, we mutate the feature names, in order to 
# make them valid R variable names; specifically, we change all '-' characters 
# to '.', and we remove any parentheses. 
tidy_features <- fread("./UCI HAR Dataset/features.txt") %>%
                 filter( grepl('mean\\(|std\\(', V2) ) %>%
                 mutate( V2 = gsub('-', '.', gsub('[()]', '', V2) ) ) 

# Read the activity_labels.txt file, which maps the activity numbers to 
# activity labels (e.g., 1 maps to 'WALKING').                      
activity_labels <- fread("./UCI HAR Dataset/activity_labels.txt")

# Next, we read and process the files comprising the test data set.

# Read the subject_test.txt data set and rename the 'V1' variable to 'subject'.
subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt") %>%
                setnames('V1', 'subject')    
    
# Read the y_test.txt file, which contains the activity numbers for each observation
# in the test data set. We change the activity numbers to activity labels using the mutate 
# function. Also, we rename the 'V1' variable to 'activity'.
y_test_tidy <- fread("./UCI HAR Dataset/test/y_test.txt") %>%
               mutate( V1 = activity_labels$V2[V1] ) %>%
               rename( activity = V1 )

# Read the X_test.txt data set.
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

# Create the X_test_tidy data frame by selecting only the tidy features (i.e., 
# the mean and std features) from X_test.
X_test_tidy <- X_test[, tidy_features[, V1] ]

# Rename the variables (i.e., column names) in X_test_tidy to use the tidy feature names.
names(X_test_tidy) <- tidy_features[,V2]

# Create merged_test by cbind'ing the three test data frames.
merged_test <- cbind( subject_test, y_test_tidy, X_test_tidy )

# Next, we read and process the files comprising the training data set.

# Read the subject_train.txt data set and rename the 'V1' variable to 'subject'.
subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt") %>%
                 setnames('V1', 'subject')    
    
# Read the y_train.txt file, which contains the activity numbers for each observation
# in the training data set. We change the activity numbers to activity labels using the mutate 
# function. Also, we rename the 'V1' variable to 'activity'.
y_train_tidy <- fread("./UCI HAR Dataset/train/y_train.txt") %>%
                mutate( V1 = activity_labels$V2[V1] ) %>%
                select( activity = V1 )

# Read the X_train.txt data set.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Create the X_train_tidy data frame by selecting only the tidy features (i.e., 
# the mean and std features) from X_train.
X_train_tidy <- X_train[, tidy_features[, V1] ]

# Rename the variables (i.e., column names) in X_train_tidy to use the tidy feature names.
names(X_train_tidy) <- tidy_features[,V2]
    
# Create merged_train by cbind'ing the three training data frames.
merged_train <- cbind( subject_train, y_train_tidy, X_train_tidy )

# Next, we merge (via rbind) the merged_train and merged_test data frames.  
merged_both <- rbind( merged_train, merged_test )

# Create tidy_data from merged_both; tidy_data is an independent tidy data set 
# containing the average of each variable for each activity and each subject in merged_both.  
tidy_data <- merged_both %>% group_by( activity, subject ) %>% summarise_each( funs(mean) )

# Finally, we write the tidy_data data set to the 'tidy_data.txt' file.
write.table( tidy_data, file="tidy_data.txt", row.name=FALSE )
