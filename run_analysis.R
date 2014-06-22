### Project
### Coursera - Getting and Cleaning Data
### Ryan Emerson

library(reshape2)

### 1. Merges the training and the test sets to create one data set
### + 3. Uses descriptive activity names to name the activities in the data set
### + 4. Appropriately labels the data set with descriptive activity names

## Read in the data from files
setwd('/Users/Ryan/Documents/R/UCI HAR Dataset/');
# Training Data
activityLabels <- read.table('./activity_labels.txt',header=FALSE)
features       <- read.table('./features.txt',header=FALSE)
subjectTrain   <- read.table('./train/subject_train.txt',header=FALSE)
xTrain         <- read.table('./train/x_train.txt',header=FALSE)
yTrain         <- read.table('./train/y_train.txt',header=FALSE)
yTrainPlus     <- data.frame(activityId = factor(yTrain$V1, labels = activityLabels$V2))
# Test Data
subjectTest <- read.table('./test/subject_test.txt',header=FALSE)
xTest       <- read.table('./test/x_test.txt',header=FALSE)
yTest       <- read.table('./test/y_test.txt',header=FALSE)
yTestPlus   <- data.frame(activityId = factor(yTest$V1, labels = activityLabels$V2))


## Assign column names
# Training Data
colnames(activityLabels)  <- c('activityId','activityType')
colnames(subjectTrain)    <- "subjectId"
colnames(xTrain)          <- features[,2]
colnames(yTrain)          <- "activityId"
# Test Data
colnames(subjectTest) <- "subjectId"
colnames(xTest)       <- features[,2] 
colnames(yTest)       <- "activityId"

## Merge Datasets
trainingData <- cbind(yTrainPlus,subjectTrain,xTrain)
testData     <- cbind(yTestPlus,subjectTest,xTest)
Data         <- rbind(trainingData, testData)

### 2. Extracts only the measurements on the mean and standard deviation for each measurement
extractThis   <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
tidyData      <- Data[c("activityId", "subjectId", extractThis),]

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidyDataMelt <- melt(tidyData, id=c("activityId", "subjectId"), measure.vars=extractThis)
tidyDataMean <- dcast(tidyDataMelt, activityId + subjectId ~ variable, mean)

### Write data to txt file
write.table(tidyData, file = "./tidyData.txt")