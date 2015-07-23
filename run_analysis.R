setwd("C:/Users/Roro7_000/Documents/MOOC/getting data/project/UCI HAR Dataset")

# Question 1 : merge data frame

testX<-read.table("test/X_test.txt")
dfTest<-as.data.frame(testX)

trainX<-read.table("train/X_train.txt")
dfTrain<-as.data.frame(trainX)

#merge by row
dfTotal<-rbind(dfTest,dfTrain)

#affect labels
features<-read.table("features.txt")
colnames<-c(features)$V2
colnamesVect<-as.vector(colnames)
colnames(dfTotal)<-colnamesVect


# question 2

dfTotalSub<-dfTotal[,grep("mean\\(\\)|std\\(\\)",names(dfTotal)),]


#question 3

subjectTest<-read.table("test/subject_test.txt")
vectorTest <- as.vector(t(subjectTest['V1']))

subjectTrain<-read.table("train/subject_train.txt")
vectorTrain <- as.vector(t(subjectTrain['V1']))

subject<-c(vectorTest,vectorTrain)

#add column subject
dfFinal<-cbind(subject = subject, dfTotalSub)

#label name 
labelActivity<-read.table("activity_labels.txt", sep=" ")
vectorNamesActivity<-as.vector(t(labelActivity[2]))

activityTest<-read.table("test/y_test.txt")
vectorActiTest <- as.vector(t(activityTest['V1']))

activityTrain<-read.table("train/y_train.txt")
vectorActiTrain <- as.vector(t(activityTrain['V1']))

activity<-c(vectorActiTest,vectorActiTrain)

#add column activity
dfFinal<-cbind(activity = activity, dfFinal)

#replace number activity by names activity
dfFinal$activity[dfFinal$activity==1] <- "WALKING"
dfFinal$activity[dfFinal$activity==2] <- "WALKING_UPSTAIRS"
dfFinal$activity[dfFinal$activity==3] <- "WALKING_DOWNSTAIRS"
dfFinal$activity[dfFinal$activity==4] <- "SITTING"
dfFinal$activity[dfFinal$activity==5] <- "STANDING"
dfFinal$activity[dfFinal$activity==6] <- "LAYING"


#Question 4
#Appropriate labels
names(dfFinal)<-gsub("-",".",names(dfFinal))
names(dfFinal)<-gsub("mean","MeanValue",names(dfFinal))
names(dfFinal)<-gsub("std",".StandardDeviation",names(dfFinal))
names(dfFinal)<-gsub("\\(|\\)","",names(dfFinal))


#Question 5
library(dplyr)
df<-dfFinal %>% group_by(subject,activity) %>% summarise_each(funs(mean))
write.table(df,"tidyDataFrame.txt", row.names = F, sep = " ")