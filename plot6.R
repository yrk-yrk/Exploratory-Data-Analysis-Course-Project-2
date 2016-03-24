library(ggplot2)
if (!"NEI" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

veh <- SCC[grepl("Veh", SCC$Short.Name, ignore.case=TRUE),];
cityData <- subset(NEI, NEI$fips=='24510' | NEI$fips=='06037');

finalDataset <- cityData[veh$SCC %in% cityData$SCC, ]
png(filename = "./plots/plot6.png", width = 800, height = 500, units = "px");
par("mar"=c(5.1, 4.5, 4.1, 2.1))
ggplot(finalDataset, aes(year, Emissions, color = fips)) + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions")) + ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") + scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()

