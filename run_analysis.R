library(dplyr)

# Merges the training and the test sets to create one data set.
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test//X_test.txt")
y_test <- read.table("test//y_test.txt")
subject_test <- read.table("test//subject_test.txt")

x_set = rbind(x_train, x_test)
y_set = rbind(y_train, y_test)
subject_set <- rbind(subject_train, subject_test)

# Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
mean_std <- grep("-(mean|std)\\(\\)", features[, 2])
x_set <- x_set[, mean_std]
names(x_set) <- features[mean_std, 2]

# Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
y_set[, 1] <- activities[y_set[, 1], 2]
names(y_set) <- "activity"

# Appropriately labels the data set with descriptive variable names. 
names(subject_set) <- "subject"
data_set <- cbind(x_set, y_set, subject_set)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_average <- ddply(data_set, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(data_average, "data_set.txt", row.name=FALSE)
