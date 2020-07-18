## Getting & Cleaning Data 
## Peer-Graded Assignment
## Reading Files
LabelsPre <- read.delim("UCI HAR Dataset/features.txt", header = FALSE, col.names = c("functions")) 
YTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("code")) 
XTest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = LabelsPre$functions)  
XTrain <- read.table ("UCI HAR Dataset/train/X_train.txt", col.names = LabelsPre$functions) 
YTrain <- read.table ("UCI HAR Dataset/train/y_train.txt", col.names = c("code")) 
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"), header = FALSE) 
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity")) 
## Step 1 - Merging Files
XMerged <- rbind(XTrain, XTest)
YMerged <- rbind(YTrain, YTest) 
SubjectMerged <- rbind(subject_test, subject_train) 
MergedFile <- cbind(SubjectMerged, XMerged, YMerged)
## Step 2 - Extracting Deviation / Mean
means <- grep("mean", colnames(MergedFile), value = TRUE)
meansfinal <- means[!means %in% grep(paste0("meanFreq", collapse = "|"), means, value = TRUE)]
deviations <- grep("std()", colnames(MergedFile), value = TRUE) 
XMergedMeans <- MergedFile[,meansfinal]
XMergedDeviations <- MergedFile[,deviations]
CleanDataPre <- cbind(XMergedMeans, XMergedDeviations)
CleanData <- cbind(CleanDataPre, MergedFile$subject, MergedFile$code) 
## Step 3 - Renaming activities in dataset (Mergedfile$code column = activities in this case)
CleanData$`MergedFile$code` <- activities[CleanData$`MergedFile$code`, 2]
## Step 4 - Renaming columns in the dataset with more descriptive variable names 
names(CleanData)[67] <- "Subject ID"
names(CleanData)[68] <- "Activity"
names(CleanData) <- gsub("Gyro", "Gyroscope", names(CleanData))
names(CleanData) <- gsub("Acc", "Accelerometer", names(CleanData))
names(CleanData) <- gsub("Mag", "Magnitude", names(CleanData))
names(CleanData) <- gsub("^t", "Time", names(CleanData))
names(CleanData) <- gsub("BodyBody", "Body", names(CleanData))
names(CleanData) <- gsub("^f", "Frequency", names(CleanData))
names(CleanData) <- gsub("tBody", "TimeBody", names(CleanData))
names(CleanData) <- gsub("-std()", "SDeviation", names(CleanData)) 
names(CleanData) <- gsub("-mean()", "Mean", names(CleanData)) 
names(CleanData) <- gsub("gravity", "Gravity", names(CleanData))
names(CleanData) <- gsub("angle", "Angle", names(CleanData))
RenamedData <- CleanData
## Step 5 - Summary Means Dataset
Tidydata <- aggregate(RenamedData[,1:66], by = list(Activity = RenamedData$Activity, SubjectID = RenamedData$Subject),FUN = mean)
write.table(x = Tidydata, file = "finaldata.txt", row.name = FALSE)
