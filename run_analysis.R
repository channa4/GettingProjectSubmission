
#Optional Line: use to set the working directory of the data analysis locations
#setwd("ENTER FILE LOCATION")

#Read in the training and test sets
Xtest <- read.table("X_test.txt")
Xtrain <- read.table("X_train.txt")

#Combing the training set and the test set
Xset <- rbind(Xtrain, Xtest)

#Read in the feature labels
LabelSet <- read.table("features.txt", stringsAsFactors = FALSE)
Xlabels <- LabelSet[,2]

#Label the Xset
colnames(Xset) <- Xlabels

#Select only data from column names with mean() or std()

msXset <- Xset[,grep(".(mean()|std())", Xlabels)]

#Load activity labels
activityLabels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
activityLabels <- activityLabels[,2]

#Load row labels for test and training sets
testLabels <- read.table("y_test.txt")
trainLabels <- read.table("y_train.txt")
setLabels <- rbind(trainLabels, testLabels)

#Load Subject Labels for test and training sets
subjectTest <- read.table("subject_test.txt")
subjectTrain <- read.table("subject_train.txt")
subjectLabels <- rbind(subjectTrain,subjectTest)

#Generate appropriate activity labels for each row
rnames <- character()

for(id in 1:nrow(setLabels)){
  label <- setLabels[id,1]
  rnames[id] <- activityLabels[label]
}


#Add row labels to the mean/std dataset
msXset_rnames <- paste(rnames,as.character(subjectLabels[,1]))
msXset_rnames <- paste(as.character(1:nrow(msXset)), msXset_rnames)
row.names(msXset) <- msXset_rnames

meanSet <- data.frame()
newNames <- character()

count <- 1

#Create the second tidy data set by generating the means for each variable for each activity for each subject
for(i in 1:30){
  
  for(j in 1:6){
    newNames[count] <- paste(as.character(count), "MEAN ", activityLabels[j], as.character(i))
    count <- count + 1
    
    datSelect <- which(subjectLabels == i & setLabels == j)
    temp <- lapply(msXset[datSelect,], FUN = mean)
    names(temp) <- names(meanSet)
    meanSet <- rbind(meanSet,temp)
  }
}

row.names(meanSet) <- newNames
colnames(meanSet) <- colnames(msXset)



#Export both data sets to a text file
write.table(meanSet, file = "tidyset2.txt", row.names = FALSE)
write.table(msXset, file = "tidyset1.txt", row.names = FALSE)




#Clear unused data
rm(setLabels)
rm(subjectLabels)
rm(subjectTest)
rm(subjectTrain)
rm(testLabels)
rm(trainLabels)
rm(Xset)
rm(Xtest)
rm(Xtrain)
rm(activityLabels)
rm(id)
rm(label)
rm(rnames)
rm(Xlabels)
rm(LabelSet)
rm(msXset_rnames)
rm(count)
rm(datSelect)
rm(i)
rm(j)
rm(newNames)
rm(temp)


