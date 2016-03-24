if (!"NEI" %in% ls()) {
  NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
  SCC <- readRDS("./data/Source_Classification_Code.rds")
}


png(filename = "./plots/plot2.png", width = 480, height = 480, units = "px")

totalEmissions <- subset(NEI, NEI$fips=='24510');
totalEmissions <- aggregate(totalEmissions$Emissions, list(totalEmissions$year), FUN = "sum")
plot(totalEmissions, type = "l", xlab = "Year", main = "Total Emissions in the Baltimore City,Maryland from 1999 to 2008", ylab = expression('Total PM'[2.5]*" Emission"))
dev.off()
