 
For the files imported into R, the col.names argument was used to assign column names to the columns within the text files based on the meaning of each column's data -- for example, the activity_labels.txt file had two columns with an index and their corresponding activities, where the index was used in the test and train files. 

The final 'test' and 'train' data frames consisted of the x and y files of both train and test columns merged based on relevant column variables. The merged_frame was created to merge the test and train frames using rbind().

Upon merging to create the merged_frame data frame, the 'std' and 'meannames' variables were used along with the select() function of dplyr to separate only columns that had the mean and standard deviation information from the larger set of test and train variables. 

Through subsetting, the Activity column of the 'cleanedmergedframe' that was produced upon merging was replaced with the actual activities that the indexes correspond to, and the dplyr function arrange() was used to arrange the data frame in ascending order of subject. This created the data frame called 'finalframe'

Finally, the grouped_data variable was created, and through the group_by() function, the final frame's Subject column was grouped by the Activity. This created groups of subjects and all the data corresponding to each activity. The final TidySet data frame was created using the summarise() function that applied the mean function across every column of the groups. 

Variables in the final TidySet data frame:
Subject - The number corresponding to the individual whose data is being measured. 
Activity - The activity that the subject is conducting for which data is being measured. (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS)
Std columns - Contain the average standard deviation of all the measurements taken for each subject doing each activity.
Mean columns - Contain the average of all the measurements taken for each subject doing each activity.
