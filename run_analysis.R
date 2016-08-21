library(dplyr)
setwd("./UCI_HAR_Dataset") #note the name, change path if not a child of current working dir
#####LOAD FILES
activity_labels<-read.csv("activity_labels.txt", header = FALSE, sep = " ")
features<-read.table("features.txt", strip.white = TRUE, header = FALSE, as.is = TRUE)
x_test<-read.csv(file.path(".", "test", "X_test.txt"), header=FALSE, sep="")
y_test<-read.csv(file.path(".", "test", "y_test.txt"), header=FALSE, sep="")
subject_test<-read.csv(file.path(".", "test", "subject_test.txt"), header=FALSE, sep="")
x_train<-read.csv(file.path(".", "train", "X_train.txt"), header=FALSE, sep="")
y_train<-read.csv(file.path(".", "train", "y_train.txt"), header=FALSE, sep="")
subject_train<-read.csv(file.path(".", "train", "subject_train.txt"), header=FALSE, sep="")
#####INTEGRATE TABLE DATA
test_set<-cbind(subject_test,y_test,x_test) #combine subject, activity, and measures cols
train_set<-cbind(subject_train,y_train,x_train) #combine subject, activity, and measures cols
full_set<-rbind(test_set, train_set) #combine test and train rows
rm(x_test, x_train, y_test, y_train, subject_test, subject_train, test_set, train_set) #no longer needed
colnames(full_set)<-c("subject","activity",features[[2]]) #names from activity file, except 1st column
#####TRIM TO DESIRED DATA SET AND LABEL
answer_set<-full_set[ ,grep("subject|activity|mean[/(]|std[/(]",names(full_set))] #reduce to only mean and std measures
rm(full_set, features) #no longer needed
colnames(activity_labels)<-c("activity", "activity_label")
answer_set<-left_join(answer_set, activity_labels) #add labels
answer_set<-answer_set[,c(1:2,69,3:68)] #moving labels to the front for usability
#####BUILD SUMMARY TABLE
averages_tbl<-   #creating summary of averages(mean) by subject and activity
  group_by(answer_set,subject,activity_label) %>%
    summarise_each(funs(mean), -activity) #excluded activity code, if wanted should add to group by 

