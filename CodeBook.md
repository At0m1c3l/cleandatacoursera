---
title: "CodeBook"
author: "Alexander Yang"
date: "7/18/2020"
output: html_document
---

## Introduction 

Welcome to the CodeBook for this Getting & Cleaning Data Assignment, the final project for week 4. 

## Data Collection

The data for this project was sourced from the UCI Machine Learning Repository - this data is from accelerometers from a Samsung smartphone, the Galaxy S.  

## Experiment Information 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record, the following is provided: 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## File Information 

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## Cleaned Dataset

The cleaned dataset for this proejct consists of 1 file, titled "finaldata.txt". To access this file, use the following code: 

``` 
data <- read.table("finaldata.txt")
``` 

The file has 68 columns and 180 rows. To view more information regarding the structure of the final dataset, use the following code: 

```
str(data)
```

## Identifying Columns

Each row in the dataset represents one subject and one activity. The raw data contained multiple measurements for each subject and activity, hence these measurements were averaged for the final dataset. 

While most columns present collected data, there are two columns in the final dataset that help to identify the subject and activity of each row. 

#### Activity
* The activity performed by the subject when measurements were taken. There are six forms of activity.

###### WALKING 
###### WALKING_UPSTAIRS
###### WALKING_DOWNSTAIRS
###### SITTING
###### STANDING
###### LAYING

#### Subject ID 
* The identification number for each subject participating in the study. 
* There are 30 IDs, ranging from 1 to 30. 

## Measurement Columns 

As mentioned previously, most columns in the final dataset represent the collected data. To view the columns in more detail, use the str() command. The basic column names, however, will also be listed here: 

* X1.TimeBodyAccelerometer.mean...X
* X2.TimeBodyAccelerometer.mean...Y
* X3.TimeBodyAccelerometer.mean...Z
* X41.tGravityAccelerometer.mean...X
* X42.tGravityAccelerometer.mean...Y
* X43.tGravityAccelerometer.mean...Z
* X81.TimeBodyAccelerometerJerk.mean...X
* X82.TimeBodyAccelerometerJerk.mean...Y
* X83.TimeBodyAccelerometerJerk.mean...Z
* X121.TimeBodyGyroscope.mean...X
* X122.TimeBodyGyroscope.mean...Y
* X123.TimeBodyGyroscope.mean...Z
* X161.TimeBodyGyroscopeJerk.mean...X
* X162.TimeBodyGyroscopeJerk.mean...Y
* X163.TimeBodyGyroscopeJerk.mean...Z
* X201.TimeBodyAccelerometerMagnitude.mean..
* X214.tGravityAccelerometerMagnitude.mean..
* X227.TimeBodyAccelerometerJerkMagnitude.mean..
* X240.TimeBodyGyroscopeMagnitude.mean..
* X253.TimeBodyGyroscopeJerkMagnitude.mean..
* X266.fBodyAccelerometer.mean...X
* X267.fBodyAccelerometer.mean...Y
* X268.fBodyAccelerometer.mean...Z
* X345.fBodyAccelerometerJerk.mean...X
* X346.fBodyAccelerometerJerk.mean...Y
* X347.fBodyAccelerometerJerk.mean...Z
* X424.fBodyGyroscope.mean...X
* X425.fBodyGyroscope.mean...Y
* X426.fBodyGyroscope.mean...Z
* X503.fBodyAccelerometerMagnitude.mean..
* X516.fBodyAccelerometerJerkMagnitude.mean..
* X529.fBodyGyroscopeMagnitude.mean..
* X542.fBodyGyroscopeJerkMagnitude.mean..
* X4.TimeBodyAccelerometer.std...X
* X5.TimeBodyAccelerometer.std...Y
* X6.TimeBodyAccelerometer.std...Z
* X44.tGravityAccelerometer.std...X
* X45.tGravityAccelerometer.std...Y
* X46.tGravityAccelerometer.std...Z
* X84.TimeBodyAccelerometerJerk.std...X
* X85.TimeBodyAccelerometerJerk.std...Y
* X86.TimeBodyAccelerometerJerk.std...Z
* X124.TimeBodyGyroscope.std...X
* X125.TimeBodyGyroscope.std...Y
* X126.TimeBodyGyroscope.std...Z
* X164.TimeBodyGyroscopeJerk.std...X
* X165.TimeBodyGyroscopeJerk.std...Y
* X166.TimeBodyGyroscopeJerk.std...Z
* X202.TimeBodyAccelerometerMagnitude.std..
* X215.tGravityAccelerometerMagnitude.std..
* X228.TimeBodyAccelerometerJerkMagnitude.std..
* X241.TimeBodyGyroscopeMagnitude.std..
* X254.TimeBodyGyroscopeJerkMagnitude.std..
* X269.fBodyAccelerometer.std...X
* X270.fBodyAccelerometer.std...Y
* X271.fBodyAccelerometer.std...Z
* X348.fBodyAccelerometerJerk.std...X
* X349.fBodyAccelerometerJerk.std...Y
* X350.fBodyAccelerometerJerk.std...Z
* X427.fBodyGyroscope.std...X
* X428.fBodyGyroscope.std...Y
* X429.fBodyGyroscope.std...Z
* X504.fBodyAccelerometerMagnitude.std..
* X517.fBodyAccelerometerJerkMagnitude.std..
* X530.fBodyGyroscopeMagnitude.std..
* X543.fBodyGyroscopeJerkMagnitude.std..

## Procedure for Cleaning Data 

To transform the raw dataset into the final dataset, the following steps were used. These steps can be executed again using the "runanalysis.R" script. 

* STEP 1: The training and test sets were merged to create one dataset. 
* STEP 2: Measurements for mean and standard deviation were extracted, while others were discarded. 
* STEP 3: Descriptive activity names were used to name the "Activity" column in the dataset. 
* STEP 4: Other column names were modified appropriately to have more descriptive labels. 
* STEP 5: The averages of each variable for each activity and subject were taken to create the final data.

These steps are labeled in the script to be easily found and isolated, if necessary.

## Additional Repo Information

There are three aspects (including this file) in the repository for this assignment. 

* runanalysis.R 

###### The script used to clean the raw dataset.

* CodeBook.md 

##### A markdown file that describes variables, the data, and the process of cleaning the raw dataset.

* README.md 

###### A markdown file that explains how parts of the analysis script work, and how they're connected.