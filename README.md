# GettingDataProject

## How the script works

#####question 1

The script merges the data frames from X_test.txt and X_train.txt
and affects the labels of columns with features.txt

#####question 2

The script subsets the data frame with the grep command in order to get the columns with mean and std

#####question 3

The script adds two columns "subject" and "activity" in the two first columns ( cbind function), gets the identifiant of subject in subject_test.txt and subject_train.txt and the activity names in y_test.txt and y_train.txt. Finally, the script affects the names of activity with their number (1,2,3,4,5 and 6)

#####question 4

Thanks to gsub function, the script renames the column in order to have tidy data frame

#####question 5

The script groups by subject and activity to get the mean of each column in the tidy data frame.
