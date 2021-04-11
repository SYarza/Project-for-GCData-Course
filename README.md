# Project-for-GCData-Course
Repository for the course project Getting and Cleaning Data

This repository has only one cript which performs the complete analysis of the data. In order to run correctly, the script must be run on a folder containing the "test" and "train" folders, and the "activity_labels.txt" and "features.txt" files.
The scripts reads the "test.txt" into a data frame, the "train.txt" into another data frame, and then merges those data frames into a single data frame called "completeData".
Then, the script extracts the variables corresponding to the mean and the standar deviation of every measurement to form yet another data frame called "mean_stdData".
After that, the script adds the "activity" variable to the data frame, and gives to each number the corresponding activity name. This is all saved in a data frame called "mean_stdData2".
Later, the scripts adds the "subject" variable to the data frame.
Finally, the data frame is grouped by subject and activity and the mean for each variable left in the data frame is computed into a final data frame called "finalData".
This data frame is then written in the file "TidyData.txt".
It is needed to have the package "dplyr" installed to run the script.
