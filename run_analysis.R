
# 1. Merges the training and the test sets to create one data set.

# Train, test and subject for X

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")


# -"- for y

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")

# Sujects

subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")

# Data sets


x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)



# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")

mean_and_std_measurements <- grep("-(mean|std)\\(\\)", features[, 2])

# Tuning columns

x_data <- x_data[, mean_and_std_measurements]
names(x_data) <- features[mean_and_std_measurements, 2]

# 3.Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
y_data[,1] = activities[y_data[,1], 2]
names(y_data) <- "activity"

# 4. Appropriately labels the data set with descriptive variable names. 

names(subject_data) <- "subject"
tidy_data <- cbind(x_data, y_data, subject_data)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#libary plyr needed
library(plyr)
avarages_for_activity_and_subjects <- ddply(tidy_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(avarages_for_activity_and_subjects, "data_with_averages.txt", row.name=FALSE)
