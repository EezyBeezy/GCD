# Code Book

[data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
[Description] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

# Variables

## Variables taken from the original data: 
x_train, y_train, x_test, subject_train, subject_test

## Variables created by merging and correcting data:
x_data, y_data, x_test. y_test, subject_data, features and activities

## Variables proceeded by output:
avrages_for_activity and tidy_data


#R-script will perform followig tasks to clean up the data.

* Merges training and test set to create data sets named x_data that contains x_test and x_train,
same with y. Lastly subject_data containing subject_test and subject_train. 

*Extracts measurements on the mean and std for every measurement from features in original data.

* Takes activity names from activity_labels.txt and address them to dataset

*Corrects column names

* Creates dataset named tidy_data with average measures for each 30 subjects and 6 activity type.

* Writes outputfile data_with_averages.txt
 