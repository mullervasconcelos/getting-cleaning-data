# Final project for the Getting and Cleaning Data Course from the Data Science Specialization at Johns Hopkins University.

- This repository contains

	1. dataset.zip - The original dataset from the UCI HAR data set (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

	2. HAR.csv and HAR2.csv - The two merged datasets containing tidy data satisfying the requirements of the project

	3. A codebook describing the structure of the data sets HAR.csv and HAR2.csv 

	4. run_analysis.R - A file that downloads the original data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip, merges the "training" with the "test" data sets and extract the variables corresponding to the mean and standard deviation, rename the variables using descriptive labels and creates two files: HAR.csv and HAR2.csv (HAR2.csv is a summary of HAR.cvs grouped by subject and activity).

