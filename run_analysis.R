## Getting and Cleaning Data Course Project
## R script called run_analysis.R
## Merges training and test sets into one dataset
## Extracts mean and SD for each measurement
## Uses descriptive activity names to name the activities in the dataset
## Label dataset with descriptive variable names
## From earlier data set, create a second, independent tidy data set with the
## average of each variable for each activity and each subject

library(dplyr)

## Read in data sets adding column names
activitylab <- read.table("./activity_labels.txt", header = FALSE)

features <- read.table("./features.txt", header = FALSE)

trainRowid <- read.table("./train/subject_train.txt", header = FALSE)
trainData <- read.table("./train/X_train.txt", header = FALSE)
trainLabels <- read.table("./train/y_train.txt", header = FALSE)

testRowid <- read.table("./test/subject_test.txt", header = FALSE)
testData <- read.table("./test/X_test.txt", header = FALSE)
testLabels <- read.table("./test/y_test.txt", header = FALSE)

## Merge datasets.
traindatatemp <- cbind(trainRowid, trainLabels, trainData)
testdatatemp <- cbind(testRowid, testLabels, testData)
datatemp <- rbind(traindatatemp, testdatatemp)

## Add in Variable Names
featlist <- as.vector(features$V2)
colabels <- unlist(c("ParticipantID", "ActivityID", featlist))
colnames(datatemp) <- colabels

## Add in descriptive activity label to corresponding ActivityID
colnames(activitylab) <- c("ActivityID", "Activity")
datatemp <- merge(datatemp, activitylab, by = "ActivityID")

## Write data file to csv file
write.csv(datatemp, file = "tidy.txt", row.names = FALSE)


## Extract Mean and SD for each measurement
table.colmeansd <- data.frame()
table.colmeansd <- datatemp[ , c("tBodyAcc-mean()-X"
                                ,"tBodyAcc-mean()-Y"
                                ,"tBodyAcc-mean()-Z"
                                ,"tGravityAcc-mean()-X"
                                ,"tGravityAcc-mean()-Y"
                                ,"tGravityAcc-mean()-Z"
                                ,"tBodyAccJerk-mean()-X"
                                ,"tBodyAccJerk-mean()-Y"
                                ,"tBodyAccJerk-mean()-Z"
                                ,"tBodyGyro-mean()-X"
                                ,"tBodyGyro-mean()-Y"
                                ,"tBodyGyro-mean()-Z"
                                ,"tBodyGyroJerk-mean()-X"
                                ,"tBodyGyroJerk-mean()-Y"
                                ,"tBodyGyroJerk-mean()-Z"
                                ,"tBodyAccMag-mean()"
                                ,"tGravityAccMag-mean()"
                                ,"tBodyAccJerkMag-mean()"
                                ,"tBodyGyroMag-mean()"
                                ,"tBodyGyroJerkMag-mean()"
                                ,"fBodyAcc-mean()-X"
                                ,"fBodyAcc-mean()-Y"
                                ,"fBodyAcc-mean()-Z"
                                ,"fBodyAccJerk-mean()-X"
                                ,"fBodyAccJerk-mean()-Y"
                                ,"fBodyAccJerk-mean()-Z"
                                ,"fBodyGyro-mean()-X"
                                ,"fBodyGyro-mean()-Y"
                                ,"fBodyGyro-mean()-Z"
                                ,"fBodyAccMag-mean()"
                                ,"fBodyBodyAccJerkMag-mean()"
                                ,"fBodyBodyGyroMag-mean()"
                                ,"fBodyBodyGyroJerkMag-mean()"
                                ,"tBodyAcc-std()-X"
                                ,"tBodyAcc-std()-Y"
                                ,"tBodyAcc-std()-Z"
                                ,"tGravityAcc-std()-X"
                                ,"tGravityAcc-std()-Y"
                                ,"tGravityAcc-std()-Z"
                                ,"tBodyAccJerk-std()-X"
                                ,"tBodyAccJerk-std()-Y"
                                ,"tBodyAccJerk-std()-Z"
                                ,"tBodyGyro-std()-X"
                                ,"tBodyGyro-std()-Y"
                                ,"tBodyGyro-std()-Z"
                                ,"tBodyGyroJerk-std()-X"
                                ,"tBodyGyroJerk-std()-Y"
                                ,"tBodyGyroJerk-std()-Z"
                                ,"tBodyAccMag-std()"
                                ,"tGravityAccMag-std()"
                                ,"tBodyAccJerkMag-std()"
                                ,"BodyGyroMag-std()"
                                ,"tBodyGyroJerkMag-std()"
                                ,"fBodyAcc-std()-X"
                                ,"fBodyAcc-std()-Y"
                                ,"fBodyAcc-std()-Z"
                                ,"fBodyAccJerk-std()-X"
                                ,"fBodyAccJerk-std()-Y"
                                ,"fBodyAccJerk-std()-Z"
                                ,"fBodyGyro-std()-X"
                                ,"fBodyGyro-std()-Y"
                                ,"fBodyGyro-std()-Z"
                                ,"fBodyAccMag-std()"
                                ,"fBodyBodyAccJerkMag-std()"
                                ,"fBodyBodyGyroMag-std()"
                                ,"fBodyBodyGyroJerkMag-std()")]


