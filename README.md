# Getting Cleaning Data
by Eugene Kim
README.md

## Overview
This repo contains the following files:

1. `README.md`
	- This is the README.md file you are currently reading
2. `CodeBook.md`
	- Describes the variables, the data, and any transformations or work that was performed to clean up the data
3. `run_analysis.R`
	- This R script contains the analysis performed to create a tidy data set in the following steps:
     1. Merges the training and the test sets to create one data set.
     2. Extracts only the measurements on the mean and standard deviation for each measurement.
     3. Uses descriptive activity names to name the activities in the data set
     4. Appropriately labels the data set with descriptive variable names.
     5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Output expectations
1. Download the `UCI HAR.zip` file and extract to a folder.
2. Run the `run_analysis.R` script after setting the working directory to the folder in step 1
3. The final output will create the following:
	- A data frame `tidy_measurements` that contains a tidy dataset that summarizes the `tidy_measurements` data frame by activtiy and subject id with the averages of the remaining variables
	- A file named `tidy_dataset.txt` with a pipe (|) delimiter of `selected_measurements_summary`.