---
title: "Getting and Cleaning Data project"
output: github_document
---

### Source data and descriptions
The source data for this project is found here:

description:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

data files:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### 
The script for producing the integrated and summarized tables is run_analysis.R

### Before running the script
download and extract the data in your desired working directory.  Extraction produces a directory named "UCI HAR Dataset" with subdirectories "test" and "train".  The script will look for the data files in those three locations.  If the source files have been relocated, the script will need to be updated.

### tables produced
run_analysis.R will leave 3 data frames.  activity_labels is just a copy of one of the source files.  The other two tables, answer_set and averages_tbl are described below.

### answer_set
the full granular data set produced by integrating all of these source files:
activity_labels.txt,
features.txt,
X_test.txt,
y_test.txt,
subject_test.txt,
X_train.txt,
y_train.txt,
subject_train.txt,

The measurements included in answer_set are a subset of the original, including only the mean() and std() set of measures.  Other than being a subset, the measures are unchanged from the source data.  Variable names for the measures were added from the features.txt source file.  Note that the integration process relies heavily on the assumption that the order of variables/columns in all of the source files is in synch, since no other keys are provided for joining.
<br>
There are 3 new variables (columns) added.

<u>subject</u> - ID number of the subject (participant) - based on subject_test and subject_train 

<u>activity</u> - ID number of the activity, based on y_test and y_train

<u>activity_label</u> - descriptive label for the activity, based on activity_labels

### averages_tbl

Per instructions, the averages_tbl includes all of the measures from answer_set, but is a summary grouped to the activity and subject level, giving averages for all observations in each of those groupings.  The variable names were not changed.  All variables from answer_set were included except for the activity ID.

Additional detail on source data is included in CodeBook.md

