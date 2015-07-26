# GettingDataProject

##1. How the script works

#####question 1

I merged the two data frames from X_test.txt and X_train.txt
I affected the labels of columns thanks to features.txt

#####question 2

I subset the data frame with the grep command to order to get all columns with mean and std

#####question 3

I addeed two columns "subject" and "activity" in the two first columns ( cbind function). I get the identifiant of subject in subject_test.txt and subject_train.txt and the activity names in y_test.txt and y_train.txt. Finally, I affected the names of activity with their number (1,2,3,4,5 and 6)

#####question 4

Thanks to gsub function, I rename the column for tidy data frame

#####question 5

I grouped by subject and activity to get the mean oh each column in the tidy data frame.


##2. The code book

#####Describing variable

Each column represente a information about an output of an smartphone. In the tidy data frame, we have the mean of a mouvement by subject by activity.

The prefix 't' to denote time and the 'f' to indicate frequency domain signals.

Most informations of the tidy data are according to three axis: X Y and Z. Units of columns of tidy data are meters by second.
