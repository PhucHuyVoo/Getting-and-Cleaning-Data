#Download and preprocess the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")
#Unzip
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Step 1:
#Merges the training and the test sets to create one data set.
#Reading subject_train text file
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Reading subject_test text file
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Reading features text file
features <- read.table('./data/UCI HAR Dataset/features.txt')

#Reading activity_labels text file
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assigning column names:
#Train
colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
#Test
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
#Activity Labels
colnames(activityLabels) <- c('activityId','activityType')

#Merging 3 table above:
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

#Step 2 and Step 4:
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#Appropriately labels the data set with descriptive variable names. 
colNames <- colnames(setAllInOne)

mean_and_std <- (grepl("activityId" , colNames) | 
                         grepl("subjectId" , colNames) | 
                         grepl("mean.." , colNames) | 
                         grepl("std.." , colNames) 
)

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

#Step 3:
#Uses descriptive activity names to name the activities in the data set
setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#Step 5:
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
secTidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

write.table(secTidySet, "secTidySet.txt", row.name=FALSE)