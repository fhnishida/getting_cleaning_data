
### Variables

In "the "tidy_data.txt" we have a data frame with 180 observations and 70 variables from experiments:
The variables are:\
 $ subject                  : int  id of the volunteer/subject \
 $ activitylabels           : chr  string/name of the activity\
 $ activitycodes            : num  code number of the activity\
 $ 67 tests results         : num  67 variables with means of the results by subject and by activity:\
 (tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag,fBodyAcc, tGravityAcc, fBodyAccJerk, fBodyGyro, fBodyGyroJerk, fBodyAccMag, tGravityAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag)\
\           

### Transformations done from the original dataset
The original dataset can be downloaded in:\
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip\

And it was originally obtained from:\
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones\
\

The transformations done (see run_analysis.R) from the original dataset are the following:\
1. Merged the training and the test sets to create one data set.\
2. Extracted only the measurements on the mean and standard deviation for each measurement.\
3. Used descriptive activity names to name the activities in the data set\
4. Appropriately labeled the data set with descriptive variable names.\
5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.\

