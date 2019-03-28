
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

print(dataclean2)