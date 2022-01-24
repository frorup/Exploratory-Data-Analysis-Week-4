
## Load data 
summaryEmissions <- readRDS("summarySCC_PM25.rds")
sourceClassification <- readRDS("Source_Classification_Code.rds")

## Sum by year 
summarybyYear <- aggregate(summaryEmissions$Emissions, by=list(year=summaryEmissions$year), FUN=sum)

png(filename = "plot1.png")
plot(summarybyYear$year, summarybyYear$x, type = "l", 
     main = "Total Emissions from PM2.5 in USA",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()