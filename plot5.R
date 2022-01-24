
## Load data 
summaryEmissions <- readRDS("summarySCC_PM25.rds")
sourceClassification <- readRDS("Source_Classification_Code.rds")

## subset data from Baltimore City (fips = 24510)
##        and  from type "on road"

baltimore_onroad_data <- subset(summaryEmissions, summaryEmissions$fips=="24510" 
                                                & summaryEmissions$type=="ON-ROAD")
baltimore_onroad_year <- aggregate(baltimore_onroad_data$Emissions, 
                                   by=list(baltimore_onroad_data$year), FUN=sum)
colnames(baltimore_onroad_year) <- c("Year", "Emissions")

## create plot showing car related emissions in Baltimore City from 1999-2008
png(filename = "plot5.png")
with(baltimore_onroad_year,
     plot(Year, Emissions, type = "o", xlab = "year", ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
)
dev.off()
