library(ggplot2)
if (!"NEI" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}

coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),];

finalDataset <- merge(x=NEI, y=coal, by='SCC')
png(filename = "./plots/plot4.png", width = 800, height = 500, units = "px")
par("mar"=c(5.1, 4.5, 4.1, 2.1))

ggplot(finalDataset, aes(year, Emissions)) + geom_line(stat = "summary", fun.y = "sum") + ylab(expression('Total PM'[2.5]*" Emissions from Coal")) + ggtitle("Total Emissions in USA from 1999 to 2008 due to Coal")
dev.off()
