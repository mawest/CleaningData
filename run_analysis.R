library(dplyr)

# Import the training set data
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")

# Merge the trainig set data in one dataframe
train_data <- cbind(train_subjects, train_labels, train_set)

# Import the test set data
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")

# Merge the test set data in one dataframe
test_data <- cbind(test_subjects, test_labels, test_set)

# Combine the test and training set in one dataframe
all_data <- rbind(train_data, test_data)

# Import all column names and select the columns which contain measurements of mean and standard deviations
all_columns <- read.table("UCI HAR Dataset/features.txt")
selected_columns <- grep("mean\\(|std\\(", all_columns[,2])

# Select from the data only the subject and activity columns and the columns
# which contain measurements of mean and standard deviations
selected_data <- all_data[, c(1, 2, selected_columns + 2)]

# Import the labels of the activities and replace the activity code with human-readable labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
selected_data$V1.1 <- activities[selected_data$V1.1, 2]

# Give the columns human readable names
names(selected_data) <- c("Subject", "Activity", all_columns[selected_columns, 2])

# Export the dataset to a file
write.table(selected_data, "UCI HAR Dataset/HumanActivityMeanStd.txt", row.names = FALSE)

# Aggregate the dataset by calculating the average values for each subject and activity
summary_data <- aggregate(selected_data[, 3:68], list(selected_data$Subject, selected_data$Activity), mean)

# Give the grouping columns human readble names
names(summary_data)[c(1, 2)] <- c("Subject", "Activity")

# Export the dataset to a file
write.table(summary_data, "UCI HAR Dataset/HumanActivityAverage.txt", row.names = FALSE)
