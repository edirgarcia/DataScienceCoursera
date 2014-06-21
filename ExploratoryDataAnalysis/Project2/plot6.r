library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extracting all of the SCCs that have 'motor' in them
motorVehicles = SCC[grep("[m|M]otor",SCC$Short.Name),]
#subset to to only Baltimore and Los Angeles
motorData = subset( NEI,NEI$SCC %in% motorVehicles$SCC & (NEI$fips == "24510" | NEI$fips == "06037"))

p <- ggplot(motorData,aes(factor(year),Emissions))
p + geom_boxplot() + coord_cartesian(ylim=c(0,8)) + facet_grid(.~fips) + labs(title = "Motor Vehicle Emissions in Los Angeles / Baltimore")

dev.copy(png,file="plot6.png")
dev.off()