NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


plot.hist <- function(year){
emissionsByYear = subset(NEI$Emissions,NEI$year==year&NEI$fips=="24510")
label = paste("Log2(Emissions for " , year,")")
hist(log2(emissionsByYear),30,xlab=label,main=year)
}

par(mfrow=c(2,2))

plot.hist(1999)
plot.hist(2002)
plot.hist(2005)
plot.hist(2008)

par(mfrow=c(1,1))
title("PM2.5 by year \n in Baltimore")

dev.copy(png,file="plot2.png")
dev.off()