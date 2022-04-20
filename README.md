## About this R script
File with R code "run_analysis.R" perform 5 following steps: 
After downloading the needed dataset and unzip it, we continue to further process the data step by step according to the asssinment requirement
1. Merging the training and the test sets to create one data set.   
Reading all the data text file and outputing tables as these has mention under <br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.1 dataActivityTest , dataActivityTrain<br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.2 dataSubjectTest , dataSubjectTrain <br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1.3 dataFeaturesTest , dataFeaturesTrain <br />
Merging 2 in 1.1 ,1.2 ,1.3 table into one: <br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.1 dataSubject <br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.2 dataActivity <br />
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.3 dataFeatures <br />
Merging 2.1 ,2.2 ,2.3 into `Data` table

2. Extracting only the measurements on the mean and standard deviation for each measurement   
Store the extracted measurements into `subdataFeaturesNames` <br />
Create a array of character of `subdataFeaturesNames` array with  `subject`, `activity`

3. Using descriptive activity names to name the activities in the data set 
Read activity_labels.txt to `activityLabels`

4. Appropriately labeling the data set with descriptive variable names   
Turn the names in `Data` table from: <br />
	Start with `t`,`f` to `time`,`frequency` <br />
	`Acc`, `Gyro`, `Mag`, `BodyBody` to `Accelerometer`, `Gyroscope`, `Magnitude`, `Body`

5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject   
