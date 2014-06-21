NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoreData = subset( NEI,NEI$fips == "24510")

p <- ggplot(baltimoreData,aes(factor(year),Emissions))
p + geom_boxplot() + coord_cartesian(ylim=c(0,50)) + facet_grid(.~type) + labs(title = "Emissions by Year/Type")

dev.copy(png,file="plot3.png")
dev.off()