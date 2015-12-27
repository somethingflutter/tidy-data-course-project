# Tidy Data Project
## Files submitted in the repository
__README.md__: This file - provides a list of files submitted, a description of run_analysis.R, instructions for running run_analysis.R, a brief description of the tidy data output, and instructions for viewing the tidy data output file.

__UCI HAR dataset__: The folder containing the original data files provided in the assignment description

__run_analysis.R__: The R script which takes the original data and produces a tidy data set

__CodeBook.md__: A description of the variables contained in the final tidy data set

__tidyData.txt__: The final tidy data set that meets the three tidy data criteria:
* each variable is a column
* each observation is a row
* each type of observational unit is a table

## Running the run_analysis.R script to produce the tidy data set
run_analysis.R assumes that both it and the "UCI HAR dataset" folder are in your working directory. If that it not the case, please change your working directory or add the script and folder to your working directory. 

run_analysis.R also assumes you have installed the dplyr and tidyr packages. If you have not, please run `install.packages(c("dplyr", "tidyr"))` before running run_analysis.R.

__Step 1:__ The script will first merge the X_test, y_test, and subject_test data so that the activity type and subject number are columns alongside the results from the test, and similarly with the X_train and y_train data. Then it will merge the test and train data into a single data set by rows. It will remove all but the final combined data set for tidiness.

__Step 2:__ The variable descriptions for the original data show that some represent mean, standard deviation, min, max, and others. The assignment is only concerned with the values that represent mean and standard deviation so the script pulls out the subset of columns which correspond to either a mean or standard deviation variables as specified in the features.txt file. Again, for tidiness, it then cleans up the unnecessary larger data table.

__Step 3:__ The script turns the activity number into a factor, and then assigns new human-readable labels to the factors. I used the mapping defined in activity_labels.txt

__Step 4:__ The script uses the variable names as given in features.txt to rename the columns so that they are understandable without having to consult the features file. 

__Step 5:__ The script groups the data by activity and subject, and then calculates the mean of each column for each activity/subject combination. The results are written to tidyData.txt, preserving the column names.

## Tidy Data output
### How the data is presented
The goal is to look at the mean of each measurement for each activity by each subject. In order to satisfy the tidy data principles, the data is presented in the following way:
* The observations from each participant for each activity are rows
* Each measurement is a separate column
* There is only one observational unit in the table (the mean values of measurements for each activity/subject combination)

### How to view the tidy data set
Ensure that the tidyData.txt file is in your working directory. Then run the following script in R to view the tidy data set:
`tidyData <- read.table("tidyData.txt", header = TRUE)`

`View(tidyData)`
