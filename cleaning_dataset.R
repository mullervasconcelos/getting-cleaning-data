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