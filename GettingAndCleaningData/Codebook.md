# Code Book

Containing study design and variable description for script run_analysis.R.

## Study Design

Script has been designed to consolidate using tidy data principles and perform a level of analysis on data sourced from the accelerometers from the Samsung Galaxy S smartphone.  Additional information is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Operations used to transform data below:

1.  Data set sourced and unzipped into local working directory
2.  Column names and numbers for measure standard deviation and means extracted from training data
3.  Column names transformed to better meet tidy data principles
4.  Mean and standard deviation of measures extracted from train and test data
5.  Subject data extracted and joined to combined train test data
6.  Activity names joined to train and test data
7.  Column names added to data frame
8.  Data frame pivoted so that each activity, subject, and measure have a unique row, with mean of measure vales added as a summation.
9.  Pivoted data table returned

## Data set features

* subject: Integer representing a study participant.
* activity: String representing activity performed during measurement.
* measurement: String representing measurement taken during activity.  These are limited to standard deviation and mean.
* meanvalue: Number representing mean of measurements taken for the subject / activity / measurement combination.