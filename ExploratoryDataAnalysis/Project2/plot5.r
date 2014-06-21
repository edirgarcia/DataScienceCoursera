library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extracting all of the SCCs that have 'motor' in them
motorVehicles = SCC[grep("[m|M]otor",SCC$Short.Name),]
#subset to tonly these points
motorData = subset( NEI,NEI$SCC %in% motorVehicles$SCC & NEI$fips == "24510")

p <- ggplot(motorData,aes(factor(year),Emissions))
p + geom_boxplot() + coord_cartesian(ylim=c(0,.1)) + labs(title = "Motor Vehicle Emissions in Baltimore")

dev.copy(png,file="plot5.png")
dev.off()