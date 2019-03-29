# Download of original data set

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (file.exists("dataset.zip") == FALSE) {
  download.file(url, dest="dataset.zip", method="curl") 
}

# Reading the desired file names from the zip file

filenames = as.character(unzip("dataset.zip", list = TRUE)$Name)

# Reading the variable names of the original data set

variables <- read.table(unz("dataset.zip", filenames[2]), stringsAsFactors = F, header = FALSE)

# Selecting only the desired files (subject_train.txt, X_train.txt, y_train.txt, subject_test.txt, X_test.txt, y_test.txt)

filenames <- filenames[c(16:18,30:32)]

lst = vector("list", length(filenames))
for (i in seq_along(filenames))
  lst[[i]] = read.table(unz("dataset.zip", filenames[i]), stringsAsFactors = F, header = FALSE)

# Labeling the variables in the test data set

test_id <- lst[[1]]
names(test_id) <- "subject"

test_activity <- lst[[3]]
names(test_activity) <- "activity"

test_measures <- lst[[2]]
names(test_measures) <- variables[,2]

# Consolidating the test data set

test_data <- data.frame(test_id,test_activity)
test_data <- data.frame(test_data,test_measures)

# Labeling the variables in the trial data set

trial_id <- lst[[4]]
names(trial_id) <- "subject"

trial_activity <- lst[[6]]
names(trial_activity) <- "activity"


trial_measures <- lst[[5]]
names(trial_measures) <- variables[,2]

# Consolidating the trial data set

trial_data <- data.frame(trial_id,trial_activity)
trial_data <- data.frame(trial_data,trial_measures)

# Merging the trial and test data sets

data <- rbind(trial_data,test_data)

# Searching for the variables corresponding to the mean and standard deviation

indices <- grep("\\.mean\\.|\\.std\\.",names(data),ignore.case = TRUE)

# Selecting the variables corresponding to the mean and standard deviation

dataclean<-data[,c(1,2,indices)]

# Cleaning the variable names:

# Step 1: Converting the characters to lowercase

names(dataclean) <- tolower(names(dataclean))

# Step 2: Clearing the "."s and replacing with "_"s

names(dataclean) <- gsub("bodybody", "body", names(dataclean))
names(dataclean) <- gsub("\\.\\.\\.", "\\_", names(dataclean))
names(dataclean) <- gsub("\\.\\.", "", names(dataclean))
names(dataclean) <- gsub("^t", "time_", names(dataclean))
names(dataclean) <- gsub("^f", "freq_", names(dataclean))
names(dataclean) <- gsub("\\.", "_", names(dataclean))
names(dataclean) <- gsub("body", "body_", names(dataclean))
names(dataclean) <- gsub("gravity", "gravity_", names(dataclean))
names(dataclean) <- gsub("jerk", "_jerk", names(dataclean))
names(dataclean) <- gsub("mag", "_mag", names(dataclean))

# Step 3: Labeling the activities using descriptive character strings

dataclean$activity <- gsub(1,"walking",dataclean$activity)
dataclean$activity <- gsub(2,"walking upstairs",dataclean$activity)
dataclean$activity <- gsub(3,"walking downstairs",dataclean$activity)
dataclean$activity <- gsub(4,"sitting",dataclean$activity)
dataclean$activity <- gsub(5,"standing",dataclean$activity)
dataclean$activity <- gsub(6,"laying",dataclean$activity)

# Step 5: Creating a summarised data set with the averages of each variable grouped by subject and activity

library(dplyr)

dataclean2 <- tbl_df(dataclean) %>%
  group_by(subject,activity) %>%
  summarize_all(mean)

dataclean2 <- as.data.frame(dataclean2)

# Step 6: Saving the tidy data sets in new csv files

write.csv(dataclean, file = "HAR.csv",row.names = FALSE)
write.csv(dataclean2, file = "HAR2.csv",row.names = FALSE)
