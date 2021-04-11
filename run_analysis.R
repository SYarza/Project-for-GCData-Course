library(dplyr)

#Reads the test and train data sets and merges them
testData<-read.table("test/X_test.txt")
trainData<-read.table("train/X_train.txt")
completeData<-rbind(testData,trainData)

#Extracts only the mean and standard deviation for each measurement
features<-read.table("features.txt")
names(completeData)<-features$V2
#Selects variables whose name contain the string "mean" or "std", but not "meanFreq" nor "gravityMean"
mean_stdData<-completeData[,grep("mean|std",names(completeData))]
mean_stdData<-mean_stdData[,grep("meanFreq",names(mean_stdData),invert = TRUE)]

#Uses descriptive activity names for the activities in the data set
activities_test<-read.table("test/y_test.txt")
activities_train<-read.table("train/y_train.txt")
labels<-read.table("activity_labels.txt")
activities_test$V1<-labels[activities_test$V1,2]
activities_train$V1<-labels[activities_train$V1,2]
activities<-rbind(activities_test,activities_train)
mean_stdData2<-cbind(activities,mean_stdData)

#Labels the data set with descriptive variable names to the variables that have no name yet
#and adds the variable "subject"
subjects_test<-read.table("test/subject_test.txt")
subjects_train<-read.table("train/subject_train.txt")
subjects<-rbind(subjects_test,subjects_train)
mean_stdData3<-cbind(subjects,mean_stdData2)
names(mean_stdData3)[1:2]<-c("subject","activity")

#Creates an independent tidy data set with the average of each variable for each activity
#and each subject.
by_subject_activity<-group_by(mean_stdData3,subject,activity)
finalData<-by_subject_activity%>%summarise_all(mean,na.rm=TRUE)
names(finalData)[3:length(names(finalData))]<-paste("m",names(finalData)[3:length(names(finalData))],sep="")
write.table(finalData,"TidyData.txt",row.names = FALSE)