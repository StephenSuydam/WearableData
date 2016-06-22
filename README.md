# WearableData
This is a tidy wearable data set from the accelerometers of Samsung Galaxy S smartphones

Set your working directory to the parent location of "UCI HAR Dataset"

Process for re-running script:

Set your working directory to the parent location of "UCI HAR Dataset"

Data is imported and given the headers from the features.txt file

Columns that do not involve mean or standard deviation are eliminated

The test and train data is merged

Added in the data group(train or test), subject numbers and activity names into the data sets

Average data is calculated through aggregating the subjects and activities

