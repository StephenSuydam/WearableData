# This is the code to pull in data from an accelerometer and organize it

#load all the libraries necessary
library(xlsx)
library(XML)
library(data.table)
library(tidyr)
library(Hmisc)
library(plyr)
library(dplyr)
library(lubridate)

#importing the data
trainingheaders = read.table("./UCI HAR Dataset\\features.txt", 
                             stringsAsFactors = FALSE)
subjectsTest = read.table("./UCI HAR Dataset\\test\\subject_test.txt", 
                          stringsAsFactors = FALSE, col.names = c("subjects"))
subjectsTrain = read.table("./UCI HAR Dataset\\train\\subject_train.txt", 
                          stringsAsFactors = FALSE, col.names = c("subjects"))
activityTest = read.table("./UCI HAR Dataset\\test\\y_test.txt", 
                          stringsAsFactors = FALSE, col.names = c("activity"))
activityTrain = read.table("./UCI HAR Dataset\\train\\y_train.txt", 
                          stringsAsFactors = FALSE, col.names = c("activity"))
train<-read.table("./UCI HAR Dataset\\train\\X_train.txt",
                     col.names = c(trainingheaders[,2]))
test<-read.table("./UCI HAR Dataset\\test\\X_test.txt",
                 col.names = c(trainingheaders[,2]))


#Adding files to each other
x=grep("mean|std",trainingheaders[,2], value = FALSE)
test=test[,x]
train=train[,x]
test=cbind(group = "test",activityTest,subjectsTest,test)
train=cbind(group = "train",activityTrain,subjectsTrain,train)
sensorData=merge(train,test,all = TRUE)

#Adjusting the names of the data to make more clear
temp=sapply(sensorData$activity,switch,'1'='WALKING', "2"="WALKING_UPSTAIRS"
            ,'3'="WALKING_DOWNSTAIRS",'4'="SITTING",'5'="STANDING",'6'="LAYING")
sensorData= replace(sensorData,"activity",temp)  
names(sensorData)=gsub("\\.","",names(sensorData))
names(sensorData)=gsub("[Mm]ean","Mean",names(sensorData))
names(sensorData)=gsub("[Ss]td","Std",names(sensorData))

#Creating second data set with averages of each variable in terms of activity 
# and subject
averageData=aggregate(. ~ activity + subjects, sensorData, mean, na.rm = TRUE)
temp=sapply(averageData$group,switch,'1'='train', "2"="test")
averageData= replace(averageData,"group",temp)  

#Cleaning up global environment
rm(activityTest,activityTrain,subjectsTest
    ,subjectsTrain,test,train,trainingheaders,x,temp)
