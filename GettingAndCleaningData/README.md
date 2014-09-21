Coursera Data Science - Getting and Cleaning Data project
===================

The run_analysis.R script will transform the data from a raw data set to a tidy more manageable and descriptive tidy data schema.

The run analysis script will load:

activityLabels
features 
xTrain
yTrain
subjectTrain
xTest 
yTest 
subjectTest 

Then it will remove the parentheses dashes, and commas to use the features as names for the tidy set
then it will row bind the test set and train set files, next it will merge the activity label names and the actual label column.
finally it will column bind the labels and all of the data, and it will set the processed feature names and name the tidy data set.
Then it will write the output file in .txt format.


 
 