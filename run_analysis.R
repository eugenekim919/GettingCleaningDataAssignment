# Eugene Kim
# Getting and cleaning data
# Week 3 

# Additional information can be found here:
# http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions

## Pre-work
## Set the working directory to the UCI HAR Dataset folder from the zip file located:
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

library("tidyr")
library("dplyr")

# Get activity labels from csv file
activity_labels <- read.csv("./activity_labels.txt", sep = " ", header = FALSE)
names(activity_labels) <- c("activity_id", "activity")

# Get feature names from csv file
features <- read.csv("./features.txt", sep = " ", header = FALSE)
names(features) <- c("feature_id", "feature_name")

### Ingest test data
subject_test <- read.csv("./test/subject_test.txt", sep = " ", header = FALSE)

# Name column name for subject ids
names(subject_test) <- "subject_id"

# Ingest y_test
y_test <- read.csv("./test/y_test.txt", sep = " ", header = FALSE)
names(y_test) <- "activity_id"

# Ingest X_test as a fixed width file
X_test <- read.fwf("./test/X_test.txt", rep(16, 561), header = FALSE, colClasses = "numeric")

# Rename columns to meaningful ones for assignment requirements
names(X_test) <- paste(as.character(features$feature_name), "-", as.character(features$feature_id), sep = "")


### Ingest training data
subject_train <- read.csv("./train/subject_train.txt", sep = " ", header = FALSE)

# Name column name for subject ids
names(subject_train) <- "subject_id"

# Ingest y_train
y_train <- read.csv("./train/y_train.txt", sep = " ", header = FALSE)
names(y_train) <- "activity_id"

# Ingest X_train as a fixed width file
X_train <- read.fwf("./train/X_train.txt", rep(16, 561), header = FALSE, colClasses = "numeric")

# Rename columns to meaningful ones for assignment requirements
names(X_train) <- paste(as.character(features$feature_name), "-", as.character(features$feature_id), sep = "")


## Step 1 
## Merges the training and the test sets to create one data set.

# First apply a label to the training and test sets to differentiate
X_train$data_source <- "training"
X_test$data_source <- "test"

# Combine training and test datasets including the subject ids and activities
training_test_combined <- rbind(cbind(subject_train, y_train, X_train), 
                                cbind(subject_test, y_test, X_test))

# Step 2
# Extracts only the measurements on the mean and standard deviation for each measurement.
selected_measurements <- select(training_test_combined, 1, 2, contains("-mean()-"), contains("-std()-"), "data_source")

# Step 3
# Uses descriptive activity names to name the activities in the data set
selected_measurements <- inner_join(selected_measurements, activity_labels)

# Step 4
# Appropriately labels the data set with descriptive variable names.

# Already performed earlier in line 37 and 54
# names(selected_measurements)

# Step 5
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Set the group by criteria for activity and subject id
selected_measurements_summary <- selected_measurements %>% group_by(activity, subject_id) %>% select(-data_source)

# Summarize with the mean for all other non-grouped variables
selected_measurements_summary <- selected_measurements_summary %>% summarize_all(funs(mean)) %>% select(c(2,3,1,4:69))

# Rename names of summarized variables with a suffix of "-MEAN"
names(selected_measurements_summary)[4:69] <- paste(names(selected_measurements_summary[4:69]), "-MEAN", sep = "")

# View final tidy dataset
View(selected_measurements_summary)
