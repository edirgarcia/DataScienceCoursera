# load the data
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt")
features = read.table("UCI HAR Dataset/features.txt")

xTrain = read.table("UCI HAR Dataset/train/X_train.txt")
yTrain = read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt")

xTest = read.table("UCI HAR Dataset/test/X_test.txt")
yTest = read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt")

#remove the parentheses and commas to use this as names for the features use convention
featureNames = gsub('\\(',"",features$V2)
featureNames = gsub('\\)',"",featureNames)
featureNames = gsub(',',".",featureNames)
featureNames = gsub('-',".",featureNames)

#add the addional columns to the names
featureNames[562]= "subject"
featureNames[563]= "label"

#begin to process the data to be clean
X = rbind(xTest,xTrain)
y = rbind(yTest,yTrain)
yTransformed = merge(y,activityLabels, by.x="V1",by.y="V1")
subject= rbind(subjectTest,subjectTrain)
allData = cbind(X,subject,yTransformed$V2)

#name the columns
names(allData) = featureNames

#only get the means and standard deviations together with subject and activity
onlyMeanStd = subset(allData,TRUE,grepl('mean|std|subject|label',names(allData))) 

#add a id column
onlyMeanStd$Id = 1:length(onlyMeanStd$label)

#write the output
write.table(onlyMeanStd, file = "tidy_data.txt")

