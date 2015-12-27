library(dplyr)
library(tidyr)
##  Merges the training and the test sets to create one data set.
testData <- tbl_df(read.table("./UCI HAR Dataset/test/X_test.txt"))
testType <- tbl_df(read.table("./UCI HAR Dataset/test/y_test.txt"))
testSubjects <- tbl_df(read.table("./UCI HAR Dataset/test/subject_test.txt"))
names(testType) <- "activity"; names(testSubjects) <- "subject"
trainData <- tbl_df(read.table("./UCI HAR Dataset/train/X_train.txt"))
trainType <- tbl_df(read.table("./UCI HAR Dataset/train/y_train.txt"))
trainSubjects <- tbl_df(read.table("./UCI HAR Dataset/train/subject_train.txt"))
names(trainType) <- "activity"; names(trainSubjects) <- "subject"
combinedTest <- bind_cols(testType, testSubjects, testData)
combinedTrain <- bind_cols(trainType, trainSubjects, trainData)
combinedData <- bind_rows(combinedTest, combinedTrain)
rm("testData"); rm("testType"); rm("testSubjects")
rm("trainType"); rm("trainData"); rm("trainSubjects")
rm("combinedTest"); rm("combinedTrain")

##  Extracts only the measurements on the mean and standard deviation for each measurement. 
meanAndStdDevData <- select(combinedData, activity, subject, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, 
                            V201:V202, V214:V215, V227:V228, V240:V241, V253:V254, V266:V271,
                            V345:V350, V373:V375, V424:V429, V503:V504, V516:V517, V529:V530,
                            V552, V555:V561)
rm("combinedData")

##  Uses descriptive activity names to name the activities in the data set
meanAndStdDevData$activity <- as.factor(meanAndStdDevData$activity)
levels(meanAndStdDevData$activity) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                                        "SITTING", "STANDING", "LAYING")

##  Appropriately labels the data set with descriptive variable names.
columnNames <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
for(i in seq_along(meanAndStdDevData)){
    vNum <- extract_numeric(names(meanAndStdDevData[i]))
    if (!is.na(vNum)){ names(meanAndStdDevData)[i] <- columnNames[[2]][vNum] }
}
rm("columnNames")

##  From the data set in step 4, creates a second, independent tidy data set 
##      with the average of each variable for each activity and each subject.
perActivity <- group_by(meanAndStdDevData, activity, subject)
rm("meanAndStdDevData")
results <- summarise_each(perActivity, funs(mean))
write.table(results, "tidyData.txt")
