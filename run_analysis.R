library(downloader)

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (file.exists("dataset.zip") == FALSE) {
  download.file(url, dest="dataset.zip", method="curl") 
}

filenames = as.character(unzip("dataset.zip", list = TRUE)$Name)

variables <- read.table(unz("dataset.zip", filenames[2]), stringsAsFactors = F, header = FALSE)

filenames <- filenames[c(16:18,30:32)]

lst = vector("list", length(filenames))
for (i in seq_along(filenames))
  lst[[i]] = read.table(unz("dataset.zip", filenames[i]), stringsAsFactors = F, header = FALSE)


test_id <- lst[[1]]
names(test_id) <- "subject"
print(head(test_id))

test_activity <- lst[[3]]
names(test_activity) <- "activity"
print(head(test_activity))

test_data <- data.frame(test_id,test_activity)
print(head(test_data))

test_measures <- lst[[2]]
names(test_measures) <- variables[,2]
test_data <- data.frame(test_data,test_measures)
print(head(test_data))

trial_id <- lst[[4]]
names(trial_id) <- "subject"
print(head(trial_id))

trial_activity <- lst[[6]]
names(trial_activity) <- "activity"
print(head(trial_activity))

trial_data <- data.frame(trial_id,trial_activity)
print(head(trial_data))

trial_measures <- lst[[5]]
names(trial_measures) <- variables[,2]
trial_data <- data.frame(trial_data,trial_measures)
print(head(trial_data))

data <- rbind(trial_data,test_data)


indices <- grep("\\.mean\\.|\\.std\\.",names(data),ignore.case = TRUE)

dataclean<-data[,c(1,2,indices)]

names(dataclean) <- tolower(names(dataclean))

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

dataclean$activity <- gsub(1,"walking",dataclean$activity)
dataclean$activity <- gsub(2,"walking upstairs",dataclean$activity)
dataclean$activity <- gsub(3,"walking downstairs",dataclean$activity)
dataclean$activity <- gsub(4,"sitting",dataclean$activity)
dataclean$activity <- gsub(5,"standing",dataclean$activity)
dataclean$activity <- gsub(6,"laying",dataclean$activity)

library(dplyr)

dataclean2 <- tbl_df(dataclean) %>%
  group_by(subject,activity) %>%
  summarize_all(mean)

dataclean2 <- as.data.frame(dataclean2)

head(dataclean2)