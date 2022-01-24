
## Activate ggplot2
library(ggplot2)

## Load data 
summaryEmissions <- readRDS("summarySCC_PM25.rds")
sourceClassification <- readRDS("Source_Classification_Code.rds")


## subset data from Baltimore City (fips 24510) and Los Angeles County, 
## California (fips == "06037"). Type Data: "On the road".

balti_Cali_onroad_data <- subset(summaryEmissions, summaryEmissions$fips=="24510" |
                                 summaryEmissions$fips=="06037" &
                                 summaryEmissions$type=="ON-ROAD")
balti_Cali_onroad_year <- with( balti_Cali_onroad_data, 
                                aggregate(Emissions, by=list(fips, year),
                                FUN=sum))
colnames(balti_Cali_onroad_year) <- c("City", "Year", "Emissions")

## create plot comparing emissions from motor vehicles in Baltimore and LA from 1999-2008

png(filename = "plot6.png")
qplot(Year, Emissions, data = balti_Cali_onroad_year, color = City, geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore City (24510) / LA County (06037)") + 
  ylab("Total Emissions from motor vehicles (tons)") + 
  xlab("Year") 
dev.off()