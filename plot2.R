
## Load data 
summaryEmissions <- readRDS("summarySCC_PM25.rds")
sourceClassification <- readRDS("Source_Classification_Code.rds")

## Extract the Baltimore data -> fips == "24510"
## Sum by year the Baltimore data

summaryExtract <- subset(summaryEmissions, fips == "24510", select = c(year, Emissions) )
summarybyYear  <- aggregate(summaryExtract$Emissions, by=list(year=summaryExtract$year), FUN=sum)

png(filename = "plot2.png")
plot(summarybyYear$year, summarybyYear$x, type = "l", 
     main = "Total Emissions from PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()