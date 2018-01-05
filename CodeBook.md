# Getting Cleaning Data
by Eugene Kim
CodeBook.md

## Summary
This code book describes the variables, the data, and any transformations or work that was performed to clean up the data for the Getting Cleaning Data Assignement assignment in the `run_analysis.R` script.  This script ingests the following files from the UCI HAR Dataset:

-`activity_labels.txt`

-`features.txt`

-`features_info.txt`

-`/test/subject_test.txt`

-`/test/X_test.txt`

-`/test/y_test.txt`

-`/train/subject_train.txt`

-`/train/X_train.txt`

-`/train/y_train.txt`

The following objects (with descriptions) are created in the `run_analysis.R' script

-`activity_labels`: contains the 6 categories of activities recorded

-`features`: contains the list of variables that were calculated from the RAW data and available for analysis

-`subject_test`: contains the corresponding subject id of the variables in X_test within the test population

-`y_test`: contains the corresponding activity of the variables in X_test within the test population

-`X_test`: contains the variables for the test population

-`subject_train`: contains the corresponding subject id of the variables in X_train within the test population

-`y_train`: contains the corresponding activity of the variables in X_train within the test population

-`X_train`: contains the variables for the test population

## Tidying data steps
1. Ingests all of the files above.
2. Create a combined data frame of test and training data called `training_test_combined` with the activity id and subject id.
3. Trim `training_test_combined` with only the variables that pertain to mean and standard deviation.  Add the activity description.
4. Group and melt the data set by activity and subject id then create the final tidy dataset with the averages of the variables into `tidy_measurements`.





