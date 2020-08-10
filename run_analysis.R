## Create data directory/folder, if doesn't exist
setwd(".")
if(!file.exists("./data")){dir.create("./data")}
library(data.table)
library(tidyverse)

# You should create one R script called run_analysis.R that does the following:

# Merges the training and the test sets to create one data set.
## . Extracts only the measurements on the mean and standard deviation for
##   each measurement.
## . Uses descriptive activity names to name the activities in the data set
## . Appropriately labels the data set with descriptive variable names.
## . From the data set in step 4, creates a second, independent tidy data set 
##   with the average of each variable for each activity and each subject.


# 1. Merges the training and the test sets to create one data set.
col_features <- read.table("./data/features.txt")

subject_test <- read.table("./data/test/subject_test.txt")
colnames(subject_test) <- "subject"
X_test <- read.table("./data/test/X_test.txt")
colnames(X_test) <- col_features$V2
y_test <- read.table("./data/test/y_test.txt")
colnames(y_test) <- "activitycodes"
test <- cbind(subject_test, y_test, X_test)

subject_train <- read.table("./data/train/subject_train.txt")
colnames(subject_train) <- "subject"
type_train <- data.table(type = rep("train", nrow(subject_train)))
colnames(X_train) <- col_features$V2
y_train <- read.table("./data/train/y_train.txt")
colnames(y_train) <- "activitycodes"
train <- cbind(subject_train, y_train, X_train)

db_merged <- rbind(test, train)


# 2. Extracts only the measurements on the mean and standard deviation for
#    each measurement.
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", colnames(db_merged))
db_merged <- db_merged[, c(1, 2, 3, mean_std_columns)]
names(db_merged)


# 3. Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("./data/activity_labels.txt")
colnames(activity_labels) <- c("activitycodes", "activitylabels")

db_merged <- db_merged %>%
    left_join(activity_labels, by="activitycodes")


# 4. Appropriately labels the data set with descriptive variable names.
colnames(db_merged) <- gsub("\\(\\)", "", colnames(db_merged))


# 5. From the data set in step 4, creates a second, independent tidy data set
#    with the average of each variable for each activity and each subject.
tidy_data <- aggregate( . ~ subject + activitylabels, db_merged, mean)


# Export tidy_data
write.table(tidy_data, "./tidy_data.txt")
