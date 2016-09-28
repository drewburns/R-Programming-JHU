# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.

library(reshape2)

rm(list=ls())

filename <- "motion_data.zip"

if (!file.exists(filename)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}

if (!file.exists("UCI Data")) {
  unzip(filename)
}

featurenamesraw <- read.table("UCI HAR Dataset/features.txt")
featurenames <- as.character(featurenamesraw[,2])
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

featuresfiltered <- grep(".*mean.*|.*std.*", featurenames)
features <- featurenames[featuresfiltered]

test <- read.table('UCI HAR Dataset/test/x_test.txt')[featuresfiltered]
y_test <- read.table('UCI HAR Dataset/test/Y_test.txt')
sub_test <- read.table('UCI HAR Dataset/test/subject_test.txt')

test <- cbind(sub_test, y_test, test)


train <- read.table('UCI HAR Dataset/train/x_train.txt')[featuresfiltered]
y_train <- read.table('UCI HAR Dataset/train/Y_train.txt')
sub_train <- read.table('UCI HAR Dataset/train/subject_train.txt')

train <- cbind(sub_train, y_train, train)

combined <- rbind(test, train)
colnames(combined) <- c("subject","activity", features)

combined$activity <- factor(combined$activity, levels = activityLabels[,1], labels = activityLabels[,2])
combined$subject <- as.factor(combined$subject)

combined.melted <- melt(combined, id=c("subject","activity"))
combined.mean <- dcast(combined.melted, subject + activity ~ variable, mean)

write.table(combined.mean, "tidydata.txt", row.names = FALSE, quote = FALSE)
