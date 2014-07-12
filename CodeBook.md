

## Data source  

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

## Background Information

Experiments were conducted on 30 volunteers aged 19-48 years. Participants took part in an array of activities
while wearing a smartphone. The smartphone recorded acceleration and velocity of the users. The original data was
seperated into a training and test data set.

## Data

The dataset includes the following files:

-'activity_labels.txt'  
-'features.txt'   
-'subject_test.txt'  
-'subject_train.txt'  
-'test/x_test.txt'  
-'test/y_test.txt'    
-'train/x_train.txt'    
-'train/y_train.txt'    


## Data Transformation

1. Merge the training and the test sets to create one data set.  
2. Extract only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive activity names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

The run_analysis.R script does this by:

- Require reshape2 package  
- Load the test and training data, and the features and activity labels    
- Merge these into one dataset and label appropriately    
- Extract the collums that measure mean and standard deviation  
- Create another dataset that contains the average of each variable for each activity and each subject  
