NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData = subset( NEI,NEI$fips == "24510")
boxplot(baltimoreData$Emissions~baltimoreData$year,outline=FALSE,xlab="Year",ylab="Emissions")

title("PM2.5 by year in Baltimore")

dev.copy(png,file="plot2.png")
dev.off()