# Codebook

### Source dataset

The analysis is based on the Human Activity Recognition Using Smartphones Data Set.
This is a dataset made available at the University of California, Irvine for use by the machine learning community.
The dataset can be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information about the dataset can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset contains measurements of the sensors of a smartphone for 30 subjects who are performing several categories of activities.
The README.txt file in the dataset archive gives a summary of the study design:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person  performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a      smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial  linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

More information about the dataset can be found in the README.txt file in the dataset.
Detailed information about the measurements performed on the smartphones can be found in the file features_info.txt.

---

### Data used in the analysis

The following files from the original dataset are used in the analysis:

- activity_labels.txt : Links the class labels with their activity name.  
- features.txt : List of all features.  
- test/subject_test.txt : Each row identifies a subject from the test set. Its range is from 1 to 30.  
- test/X_test.txt : Test set.  
- test/y_test.txt : Test labels.  
- train/subject_train.txt : Each row identifies a subject from the training set. Its range is from 1 to 30.  
- train/X_train.txt : Training set.  
- train/y_train.txt : Training labels.  

All subjects are part of only one of the sets.

---

### Goal of the data analysis

Goal of the data analyse is to create two tidy datasets.\
Both datasets will contain the data of all subjects (the test and training set will be combined).\
The datasets will contain only data about the mean and standard deviations for each measurement.

Dataset 1 : Contains data about all observations\
Dataset 2 : Contains the average of each variable for each activity and each subject.

---

### Data analysis steps

The following steps are performed as part of the data analysis:

- Extract the source zip file in the current working directory. Use the appropriate operating system tools (platform dependent).  
- Import all sourcefiles needed for the analysis:
  - activity_labels.txt  
  - features.txt  
  - test/subject_test.txt  
  - test/X_test.txt  
  - test/y_test.txt  
  - train/subject_train.txt  
  - train/X_train.txt  
  - train/y_train.txt  
- Combine the data from the test and training sets in one dataframe.  
- Get all measurement-related variables in the data (the data from features.txt).  
- Select the variables that represent mean and standard deviations.    
- Remove all other measurement-related variables from the dataframe (keep subject and activity columns).  
- Get the (human-readable) labels for the different activities (the data from activity_labels.txt).  
- Replace the codes for the activities in the dataframe with the human-readable representation.  
- Replace, where necessary, column names by human-readable names (subject and activity columns).  
- Write the dataframe to a file (tidy dataset of all observations: dataset 1 above).  
- Calculate averages of each variable for each activity and subject combination (using arrange from the dplyr package).  
- Write the resulting dataframe to a file (tidy dataset of the averages for each activity and subject: dataset 2 above).  

The implementation of the steps in R code can be found in the file run_analysis.R

---

### Variables in the dataset

Both datasets contains the same variables and differ only in the aggregation level.

|NAME                       | DESCRIPTION                                 | TYPE
| ------------------------- | ------------------------------------------- | -------------------------------
|Subject                    | Id representing each volunteer in the study | integer (range 1-30)
|Activity                   | The type of activity                        | character (one of six values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
|tBodyAcc-mean()-X          |                                             |
|  ...                      | 66 measurements (description: see below)    | numeric
|fBodyBodyGyroJerkMag-std() |                                             |

The names of the measurements are assembled as follows:

| PART OF VARIABLE NAME | DESCRIPTION
| --------------------- | ------------------------------------------
| t of f                | The type of measurement: time or frequency
| Body or Gravity       | The component of the signal measured
| Acc or Gyro           | The sensor: accelerometer or gyroscope
| Jerk or ""            | Jerk signal or not
| Mag or ""             | Signal magnitude or not
| -mean() or -std()     | Type of data: mean or standard deviation
| -X or -Y or -Z        | The axis of the measurement


