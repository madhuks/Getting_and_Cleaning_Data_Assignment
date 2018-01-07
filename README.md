## Getting and Cleaning Data Course Project
This is Peer-graded Assignment for Getting and Cleaning Data Course Project
### Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
4) You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### The Contents of this repository
1. README.md
2. run_analysis.R
3. CodeBook.md
4. tidydata.txt

### Instructions on how to run this program
1. Clone this repository from the link https://github.com/madhuks/Getting_and_Cleaning_Data_Assignment
2. Launch R studio and create a working directory
3. Download the raw data from the link below
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4. Unzip the file to create the folder 'UCI HAR Dataset' and copy the folder into the working directory
5. Soure the proram 'run_analysis.R' to tidy the data 

### How the script works
Two libraries, namely 'data.table' & 'dplyr' need to be loaded for the program to work. 
1. In Part 1, the feature names and activity labels are read. Next, the training data and test data are read and then  combined into one data frame. Two columns explaining 'Activity' and 'Subject' are added to the combined data frmae
2. In Part 2, the columns pertaining to only mean and standard deviation measures were extracted from the combined data
3. In Part 3, the descriptive activity names are used to name the activities in the data set
4. In Part 4, the abbreviations are exapanded to descriptive names and column names of the data frmae of step 3 are modified with discriptive names.
5. In Part 5, a second, independent tidy data set with the average of each variable for each activity and each subject was created from Part 4. This data was written into a file.
