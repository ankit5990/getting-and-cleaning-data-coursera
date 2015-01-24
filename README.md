# getting-and-cleaning-data-coursera
Getting and Cleaning Data Course Project

This repository contains the course project for Coursera Course - Getting and Cleaning Data.

File "CodeBook.md" contains the details of transformation that is done to cleanup the data.

Scritp "run_analysis.R" is the actual script that performs data cleanup. 
The script assumes following folder structure
|
|-test
|   |-subject_test.txt
|   |-X_test.txt
|   |-y_test.txt
|-train
|   |-subject_train.txt
|   |-X_train.txt
|   |-y_train.txt
|-activity_labels.txt
|-features.txt
|-run_analysis.R

Post execution the script creates a file 'tidyData.txt' which has the tidy data.
