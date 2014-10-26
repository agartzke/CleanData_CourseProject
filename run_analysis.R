# Course Project - Getting and Cleaning Data
library(plyr)
library(reshape2)

# Load all test data
subject_test <- read.table("./data/test/subject_test.txt")
x_test <- read.table("./data/test/X_test.txt")
y_test <- read.table("./data/test/y_test.txt")

# Load all training data
subject_train <- read.table("./data/train/subject_train.txt")
x_train <- read.table("./data/train/X_train.txt")
y_train <- read.table("./data/train/y_train.txt")

# Check for NAs in x data frames - continue if clean data set
if (sum(colSums(is.na(x_train)) > 0) | sum(colSums(is.na(x_test)) > 0)) {
  stop('Missing Data!')
}

# Confirm data sets have matched dimensions before binding
test_rows <- nrow(x_test)
if (nrow(subject_test) != test_rows | nrow(y_test) != test_rows) {
  stop('Mismatched test dimension sizes')
}

train_rows <- nrow(x_train)
if (nrow(subject_train) != train_rows | nrow(y_train) != train_rows) {
  stop('Mismatched train dimension sizes')
}

# Merge test and train data sets
test_data <- cbind(subject_test, y_test, x_test)
train_data <- cbind(subject_train, y_train, x_train)
merged_data <- rbind(test_data, train_data)

# Appropriate labels with descriptive variable names
features_list <- read.table("./data/features.txt")
column_names <- rbind(c("Subject", "Activity", as.character(features_list[[2]])))
if (length(merged_data) != length(column_names)) {
  stop('Different number of columns than names')
}
names(merged_data) <- column_names

# Extracts only the measurements on the mean and std. dev. for each measure
# chose to use grep for any string match on 'mean' or 'std' in the column names
# also need to keep the Subject and Label columns
select_columns <- grepl("Subject|Activity|Mean|mean|Std|std", column_names)
extracted_data <- subset(merged_data, select=select_columns)

# Uses descriptive activity names
activities_list <- read.table("./data/activity_labels.txt")
extracted_data$Activity <- as.character(activities_list[match(extracted_data$Activity, activities_list$V1), "V2"])
extracted_data$Activity <- as.factor(extracted_data$Activity)

# build up distinct tidy data set for output - melt into skinny version, aggregate and dcast back to summarized data frame
mdata <- melt(extracted_data, id.vars=c("Subject", "Activity"))
avg_data <- ddply(mdata, .(Subject, Activity, variable), summarize, mean=mean(value))
tidy_data <- dcast(avg_data, Subject + Activity ~ variable, value.var="mean")

# Generates secondary tidy data set
write.table(tidy_data, "tidydata.txt", row.names=FALSE)



