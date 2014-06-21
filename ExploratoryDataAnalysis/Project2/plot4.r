NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Extracting all of the SCCs that have 'combustion' and 'coal' in them
coalCombustion = SCC[grep("[c|C]omb .* [c|C]oal",SCC$Short.Name),]
#subset to tonly these points
coalData = subset( NEI,NEI$SCC %in% coalCombustion$SCC)

p <- ggplot(coalData,aes(factor(year),Emissions))
p <- p + geom_boxplot() + coord_cartesian(ylim=c(0,4)) + labs(title = "Coal combustion by year")
print(p)

dev.copy(png,file="plot4.png")
dev.off()