library(ggplot2)
if (!"NEI" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}


veh <- SCC[grepl("Veh", SCC$Short.Name, ignore.case=TRUE),];
baltimoreData <- subset(NEI, NEI$fips=='24510'); 
finalDataset <- merge(x=baltimoreData, y=veh, by='SCC')
finalDataset2 <- aggregate(finalDataset$Emissions, list(finalDataset$year), FUN = "sum")

png(filename = "./plots/plot5.png", width = 800, height = 500, units = "px");
par("mar"=c(5.1, 4.5, 4.1, 2.1))
plot(finalDataset2, type = "l", xlab = "Year", main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()

