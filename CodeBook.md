run_analysis.R Code Book

Data was acquired from the location below
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within 
an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded 
accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial
 angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
 to label the data manually. The obtained dataset has been randomly partitioned into two 
 sets, where 70% of the volunteers was selected for generating the training data and 30% 
 the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise 
filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap 
(128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency 
components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency 
domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated 
body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Process for re-running script:

Set your working directory to the parent location of "UCI HAR Dataset"

Data is imported and given the headers from the features.txt file

Columns that do not involve mean or standard deviation are eliminated

The test and train data is merged

Added in the data group(train or test), subject numbers and activity names into the data sets

Average data is calculated through aggregating the subjects and activities


SensorData is all of the outputs of the combined data sets of test and training

	$group is the testing group, whether it is the "test" or "train" group of the study

	$activity is the type of activity the subject is performing

	$subject is the identifier for the individual performing the tasks (1-30)
	
AverageData is the averaged data for each variable for one subject performing each task
	
Variables

^f*	data in the frequency domain

^t*	data in the time domain

*Acc*	accelerometer data

*Gravity*	force of gravity data

*Gyro*	gyroscope data

*X|Y|Z$	the output direction

*Mean* is the average data of the data set

*Std* is the standard deviation of the data set
	
