## Getting & Cleaning Data course assignment 

library(data.table)
library(dplyr)
##
## Part 1: Merge the training and the test sets to create one data set
##
feature_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
## Read Training Data
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_feature <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
## Read Test Data
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_feature <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
## Merge the training data & test data
subject <- rbind(train_subject, test_subject)
activity <- rbind(train_activity, test_activity)
features <- rbind(train_feature, test_feature)
## Name the clumns of features, acitivity & subject 
colnames(features) <- t(feature_names[2])
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
complete_data <- cbind(features,activity,subject)
##
## Part 2: Extract only the measurements on the mean and standard deviation for each measurement
##
cols_mean_std <- grep(".*Mean.*|.*Std.*", names(complete_data), ignore.case=TRUE)
cols_needed <- c(cols_mean_std, length(complete_data)-1, length(complete_data))
mean_std_data <- complete_data[,cols_needed]
##
## Part 3: Use descriptive activity names to name the activities in the data set
##
mean_std_data$Activity <- as.character(mean_std_data$Activity)
for (i in 1:6){
    mean_std_data$Activity[mean_std_data$Activity == i] <- as.character(activity_labels[i,2])
}
mean_std_data$Activity <- as.factor(mean_std_data$Activity)
##
## Part 4: Appropriately labels the data set with descriptive variable names
##
## Replace Acc with Accelerometer
## Replace Gyro with Gyroscope
## Replace BodyBody with Body 
## Replace Mag with Magnitude
## Replace f with Frequency
## Replace t with Time
names(mean_std_data)<-gsub("Acc", "Accelerometer", names(mean_std_data))
names(mean_std_data)<-gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data)<-gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data)<-gsub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data)<-gsub("^t", "Time", names(mean_std_data))
names(mean_std_data)<-gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data)<-gsub("tBody", "TimeBody", names(mean_std_data))
names(mean_std_data)<-gsub("-mean()", "Mean", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data)<-gsub("-std()", "STD", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data)<-gsub("-freq()", "Frequency", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data)<-gsub("angle", "Angle", names(mean_std_data))
names(mean_std_data)<-gsub("gravity", "Gravity", names(mean_std_data))
##
## Part 5: From the data set in step 4, creates a second, independent tidy data set with 
##
## the average of each variable for each activity and each subject.
mean_std_data$Subject <- as.factor(mean_std_data$Subject)
mean_std_data <- data.table(mean_std_data)
tidyData <- aggregate(. ~Subject + Activity, mean_std_data, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "Tidy.txt", row.names = FALSE)

