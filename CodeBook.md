
Transformations before merging: 
For the files imported into R, the col.names argument was used to assign column names to the columns within the text files based on the meaning of each column's data -- for example, the activity_labels.txt file had two columns with an index and their corresponding activities, where the index was used in the test and train files. 

Upon merging to create the merged_frame data frame, the 'std' and 'meannames' variables were used along with the select() function of dplyr to separate only columns that had the mean and standard deviation information from the larger set of test and train variables. 
