library(dplyr)
features <- read.table("features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("activity_labels.txt", col.names = c("ActivityID", "Activity"))

#reads train data
subject_train <- read.table("train/subject_train.txt", col.names = "Subject")
y_train <- read.table("train/y_train.txt", col.names = "Activity")
X_train <- read.table("train/X_train.txt", col.names = features$feature)

#reads test data
subject_test <- read.table("test/subject_test.txt", col.names = "Subject")
y_test <- read.table("test/y_test.txt", col.names = "Activity")
X_test <- read.table("test/X_test.txt", col.names = features$feature)

#Creates the final test and train data frames
test <- cbind(Subject = subject_test$Subject, Activity = y_test$Activity, X_test)
train <- cbind(Subject = subject_train$Subject, Activity = y_train$Activity, X_train)

# Merges the test and train data frames and then separates out only the mean and standard
# deviation based on the column names.
merged_frame <- rbind(test,train) 
std <- grep("std", names(merged_frame))
meannames <- grep("mean", names(merged_frame))
cleanedmergedframe <- select(merged_frame, Subject, Activity,names(merged_frame[std]),names(merged_frame[meannames] ))

# replaces the activity indexes with their actual description and then arranges the frame in ascending order of Subject. 
cleanedmergedframe$Activity <- activity_labels$Activity[cleanedmergedframe$Activity]
finalframe <- arrange(cleanedmergedframe, Subject)

# calculating averages for all the variables after grouping them together to finalise data set.
grouped_data <- finalframe %>% group_by(Subject, Activity)
TidySet <- summarise(grouped_data, across(everything(), mean), .groups = "drop")

# Produces the .txt file 
write.table(TidySet, file = "TidySet.txt", row.names = FALSE)
 
