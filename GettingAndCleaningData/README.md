#Getting-and-Cleaning-Data-Assignment-Run-Analysis

Files Submitted:

* run_analysis.R
* README.md
* CookBook.md

##How to Use

1.  Access "run_analysis.R" script from https://github.com/gollyroger/datasciencecoursera/blob/master/GettingAndCleaningData/run_analysis.R and save into your working directory

2.  Download data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

3. Unzip folder into your working directory into a folder called "UCI-HAR Dataset" 

4.  Load the analysis script using source("run_analysis.R")

5.  Running run_analysis() returns a data frame with the averaged outcomes of the standard deviation and mean for all measures.  For future use, this data table should be stored.

##Library requirements

* This script requires packages "dplyr" and "tidyr" to be installed.  If they are not, user can install these using install.packages("dplyr") and install.packages("tidyr"), respectively.

For additional information on the source data, refer to http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones