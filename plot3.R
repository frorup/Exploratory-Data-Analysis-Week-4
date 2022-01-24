
## Load ggplot2 for plot3
library(ggplot2)

## Load data 
summaryEmissions <- readRDS("summarySCC_PM25.rds")
sourceClassification <- readRDS("Source_Classification_Code.rds")

# Extracting the Baltimore City data
summaryExtract <- subset(summaryEmissions, fips == "24510") # Extract all Baltimore Data

# Aggregating the data by type and calendar year
summarybyYear <- aggregate(summaryExtract$Emissions, by=list(summaryExtract$type, summaryExtract$year), FUN=sum)
colnames(summarybyYear) = c("Type", "Year", "Emissions")


# Set the name of output plot file and define plot. 
png(filename = "plot3.png")
qplot(Year, Emissions, data = summarybyYear, color = Type, geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore City by type") + 
  ylab("Total Emissions (tons)") + 
  xlab("Year") 
dev.off()