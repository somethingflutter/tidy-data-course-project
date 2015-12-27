# Tidy Data Project
## Files submitted in the repository
__README.md__: This file - provides a list of files submitted and a description of run_analysis.R

__run_analysis.R__: The R script which takes the original data and produces a tidy data set

__CodeBook.md__: A description of the variables contained in the final tidy data set

__UCI HAR dataset__: The folder containing the original data files and descriptions provided in the assignment description

__TBD__: The final tidy data set that meets the three tidy data criteria:
* each variable is a column
* each observation is a row
* each type of observational unit is a table

## Running the run_analysis.R script to produce the tidy data set
run_analysis.R assumes that the "UCI HAR dataset" folder is in the same folder as the script itself. Since the assignment instructions only require use of the actual measurments from the experiments and do not require information about the subjects themselves, I only use the X_test and X_train data files.

run_analysis.R also assumes you have installed the dplyr and tidyr packages. If you have not, please run <install.packages("dplyr")> and/or <install.packages("tidyr")> before running run_analysis.R.

__Step 1:__ The script will first merge the X_test and y_test data so that the activity type is a column alongside the results from the test, and similarly with the X_train and y_train data. Then it will merge the test and train data into a single data set by rows. It will remove all but the final combined data set for tidiness.

__Step 2:__ The variable descriptions for the original data show that some represent mean, standard deviation, min, max, and others. The assignment is only concerned with the values that represent mean and standard deviation so the script pulls out the subset of columns which correspond to either a mean or standard deviation variables as specified in the features.txt file. Again, for tidiness, it then cleans up the unnecessary larger data table.

__Step 3:__ The script turns the activity number into a factor, and then assigns new human-readable labels to the factors. I used the mapping defined in activity_labels.txt

__Step 4:__ 




