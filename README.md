# GettingandCleaningDataAssignment - readme
The R script contained in this repository is made as part of the Getting and Cleaning data course through coursera

The script is designed to download the zipped folder containing the data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
The information for the data set is found here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script requires no other scripts to run, but does make use of the DPLYR and downloader packages as stated at the top of the script

The data set is downloaded, a dataframe is built of just the mean and standard deviation measures in the dataset

The data is then separated by subject and by activity, the means are taken, and a new dataframe is built that contains the means for each measure (so the mean of the means and mean of the standard deviations) for each subject per activity. The dataframe also lists if the subject was used to create the training dataset or the test dataset. 

Final output is a text file in your working directory called "Finaldata.txt"
