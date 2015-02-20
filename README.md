# Coursera Getting and Cleaning Data

## How does the code work?

I commented directly in my code, because i think it is easier to follow, instead of reading everything here and compare it with the raw code. So i would recommend to look at the comments in the run_analysis.R file. 

In short:

1. I read the datafiles into R
2. Changed the column names of the raw data sets (x_train/x_test) into the names given in the features.txt
   ( I know we where supposed to change the variable names, but i didn't have enough time, so i just  used the suboptimal names     from the features.txt) 
3. Convertet the y_train values into a factor with the corresponding labels given in the activity_labels.txt
4. Merged the subject_ID,activity_labels and raw data for each training and test together
5. Combined both the training and test dataframe
6. Then i extractet the colums with "mean" or "std" in it
7. Created a tidy dataset with dplyr(group_by,summarise etc.)
