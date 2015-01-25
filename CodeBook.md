#Code Book

#Data
The script run_analysis.R creates a tidy data set tidyData.txt from the raw data set downloaded from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">here</a>. Each record of tidy data set created has following :-
- The value of average of "mean measurement" and "standard deviation measurement" for various gyroscope and accelerometer signal as mentioned in raw data. 
- The activity for which the signal data is present
- The User who performed the activity

The generated tidy data is a merged set of training and test data as present in the raw data.

The variable names for the tidy data are as follows:-
- activity.label : The name of activity for which data is logged.
  This value can be one of following :-
  - LAYING
  - SITTING
  - STANDING
  - WALKING
  - WALKING_DOWNSTAIRS
  - WALKING_UPSTAIRS
- subject : An identifier of the subject who carried out the experiment.
- An average of the mean and standard deviation of sensor data. The average corresponds to the activity for a specific subject. The names of these variables is same as that in raw data.


#Script functioning
The script 'run_analysis.R' is executed in the folder of the data as obtained from <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">link</a>. The script generates a tidy data set in file 'tidyData.txt'. The script performs following steps to create tidy data :-
- merge test and training data as provided in files 'test/X_test.txt' and 'traing/X_train.txt' respectively.
- trim down the merged data set to contain variables for mean and standard deviation only.
- merge the data obtained in previous step with data in 'activity_labels.txt' to add column for activity label.
- add variable to data set for subject identifier. This is done by merging data from 'test/subject_test.txt' and 'train/subject_train.txt' to the dataset. This is added as 'subject' variable to dataframe.
- create a final tidy data set with the average of each variable for each activity and each subject. This is done using ddply command from plyr package.
- write the tidy data to a file tidyData.txt.
