library(ggplot2)
if (!"NEI" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

totalEmissions <- subset(NEI, NEI$fips=='24510');
png(filename = "./plots/plot3.png", width = 800, height = 500, units = "px")
par("mar"=c(5.1, 4.5, 4.1, 2.1))

ggplot(totalEmissions, aes(year, Emissions, color = type)) + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
dev.off()
