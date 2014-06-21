NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sampledData = NEI[sample(1:nrow(NEI),10000),]
boxplot(sampledData$Emissions~sampledData$year,outline=FALSE,xlab="Year",ylab="Emissions")

title("PM2.5 by year")

dev.copy(png,file="plot1.png")
dev.off()