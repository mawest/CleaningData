# Getting and cleaning data


### Introduction

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data in the zipfile below represent data collected from the accelerometers from the Samsung Galaxy S smartphone. This dataset is made available at the University of California, Irvine for use by the machine learning community.

A full description is available at the site where the data can be obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data can be downloaded here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data is divided into a test set and a training set. In the data analysis both sets will be combined into one dataset.
Additionally the number of measurements in the data will be reduced to only measurements on the mean and standard deviation.

---

### Data analysis


The following steps are performed on the source data by the R-script:

- Merges the training and the test sets to create one data set.  
- Extracts only the measurements on the mean and standard deviation for each measurement.  
- Uses descriptive activity names to name the activities in the data set.  
- Appropriately labels the data set with descriptive variable names.  
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  
    
---

### Steps to reproduce the analysis
 
To reproduce the analysis take the following steps:

- Extract the files from the source data zipfile in the working directory using operating system tools (platform dependent).  
- Run the run_analysis.R script.  
- The script will create both datasets.  

---  
    
### Files

The following files are provided:

- README.md : This file.  
- CodeBook.md : Description of the source data used, the steps in the analysis and a desciption of the resulting datasets.  
- run_analysis.R : The code excuted in the analysis.  
- HumanActivityMeanStd.txt : Tidy dataset with the mean and standard deviation for each measurement.  
- HumanActivityAverage.txt : Tidy dataset with the averages for each measurement per activity and subject.  
