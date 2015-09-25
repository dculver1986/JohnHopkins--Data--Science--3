activity_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

features_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
features_train <- read.table("UCI HAR Dataset/train/X_train.txt”, header=FALSE)

combined_subject <- rbind(subject_train, subject_test)
combined_activity <- rbind(activity_train, activity_test)

combined_features <- rbind(features_train, features_test)

names(combined_subject) <- c("Subject")

names(combined_activity) <- c("activity")

feature_titles <- read.table("UCI HAR Dataset/features.txt", header=FALSE)
names(combined_features) <- feature_titles$V2

subject_w_activity <- cbind(combined_subject, combined_activity)

combined_all_data <- cbind(combined_features, subject_w_activity)
all_data_df <- as.data.frame(combined_all_data)

mean_and_sd <- feature_titles$V2[grep("mean\\(\\) | std\\(\\)", feature_titles$V2)]



select_names <- c(as.character(mean_and_sd), "Subject", "activity")

final_data <- subset(all_data_df, select=select_names)

final_data$activity <- gsub(1,"WALKING",final_data$activity)
final_data$activity <- gsub(2,"WALKING_UPSTAIRS",final_data$activity)
final_data$activity <- gsub(3,"WALKING_DOWNSTAIRS",final_data$activity)
final_data$activity <- gsub(4,"SITTING",final_data$activity)
final_data$activity <- gsub(5,"STANDING",final_data$activity)
final_data$activity <- gsub(6,"LAYING",final_data$activity)

names(final_data) <- gsub("^t", "time", names(final_data))
names(final_data) <- gsub("^f", "frequency", names(final_data))
names(final_data) <- gsub("Acc", "Accelerometer", names(final_data))
names(final_data) <- gsub("Gyro", "Gyroscope", names(final_data))
names(final_data) <- gsub("Mag", "Magnitude", names(final_data))
names(final_data) <- gsub("BodyBody", "Body", names(final_data))


second_final <- aggregate(. ~Subject + activity, final_data, mean)
second_final <- second_final[order(second_final$Subject, second_final$activity),]
write.table(second_final, file = "tidydataset.txt", row.name=FALSE)
