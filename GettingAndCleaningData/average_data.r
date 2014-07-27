#this script requires the execution of run_analysis.R previously to have the required objects added to the workspace.

#using reshape2
library(reshape2)

#filter the data
columnsToExtract = c("tBodyAcc.mean.X","tBodyAcc.mean.Y","tBodyAcc.mean.Z","tBodyAcc.std.X","tBodyAcc.std.Y","tBodyAcc.std.Z","subject","label")
filteredData = onlyMeanStd[,columnsToExtract] 

#melt over subject and label measuring everything else
filteredMelt = melt(filteredData,id=c("subject","label"),measure.vars=c("tBodyAcc.mean.X","tBodyAcc.mean.Y","tBodyAcc.mean.Z","tBodyAcc.std.X","tBodyAcc.std.Y","tBodyAcc.std.Z"))

# dcast the filtered melted data to project averages on different dimensions
averageBySubject = dcast(filteredMelt, subject ~ variable,mean)
averageByLabel = dcast(filteredMelt, label ~ variable,mean)
averageByLabelAndSubject  = dcast(filteredMelt, subject+label ~ variable,mean)

#write the output
write.table(averageBySubject, file = "averageBySubject.txt")
write.table(averageByLabel, file = "averageByLabel.txt")
write.table(averageByLabelAndSubject, file = "averageByLabelAndSubject.txt")
