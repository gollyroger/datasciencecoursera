run_analysis <- function(){
  
  ##Calling neccasary packages
  library(dplyr)
  library(tidyr)
  
  ##Get column numbers and names for train set
  xfeatures <- read.table("UCI-HAR Dataset/features.txt", header = FALSE)
  xcolumns <- c(grep("mean\\(\\)|std\\(\\)",xfeatures[,2]))
  xnames <- c(grep("mean\\(\\)|std\\(\\)",xfeatures[,2], value = TRUE))

  ##Cleaning up column names
  xnames[grep("Z|X|Y$",xnames)] <- paste(xnames[grep("Z|X|Y$",xnames)], "axis",sep = "")
  xnames <- sub("\\(","",xnames)
  xnames <- sub("\\)","",xnames)
  xnames <- tolower(xnames)
  xnames <- sub("-","_",xnames)
  xnames <- sub("-","_",xnames)
  xnames[grep("^f",xnames)] <- sub("f","frequency",grep("^f",xnames,value=TRUE))
  xnames[grep("^t",xnames)] <- sub("t","time",grep("^t",xnames,value=TRUE))  
  
  ##Get mean and std for measures for each train and test record.  
  xtrain <- read.table("UCI-HAR Dataset/train/X_train.txt", header = FALSE)[,xcolumns]
  xtest <- read.table("UCI-HAR Dataset/test/X_test.txt", header = FALSE)[,xcolumns]
  xcomb <- rbind(xtrain,xtest)

  ##Get and add subject data
  subjecttrain <- read.table("UCI-HAR Dataset/train/subject_train.txt", header = FALSE)
  subjecttest <- read.table("UCI-HAR Dataset/test/subject_test.txt", header = FALSE)
  subjectcomb<-rbind(subjecttrain,subjecttest)
  allcomb <- cbind(xcomb, subjectcomb)
  
  ##Get activities for train and test data
  ytrain <- read.table("UCI-HAR Dataset/train/y_train.txt", header = FALSE)
  ytest <- read.table("UCI-HAR Dataset/test/y_test.txt", header = FALSE)
  ycomb<-rbind(ytrain,ytest)
  
  ##Combines activites and measurements datasets
  allcomb <- cbind(allcomb,ycomb)
  
  ## Apply names to columns and activities
  colnames(allcomb) <- c(xnames,"subject","activityID")
  activitylabels <- read.table("UCI-HAR Dataset/activity_labels.txt", header = FALSE)
  colnames(activitylabels) <- c("activityID", "activity")
  allcomb <- merge(allcomb, activitylabels, by.allcomb = "activityID", by.activitylabels = "activityID")
  allcomb <- select(allcomb, -activityID)

  avgmeasures <- gather(allcomb, measurement, value, -subject, -activity) %>% group_by(subject, activity, measurement) %>% summarise(mean(value))
  names(avgmeasures)[4] <- "meanvalue"
  
  return(avgmeasures)
  
}