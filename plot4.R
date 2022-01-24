
##  Include ggplot2
library(ggplot2)

## Load data 
summaryEmissions <- readRDS("summarySCC_PM25.rds")
sourceClassification <- readRDS("Source_Classification_Code.rds")



## The word "Coal" is present in all activities involving the use of coal in the Short.Name
## Step 1: Extract all the entries related to "Coal" in the sorting catalogue sourceClassification
##         The SCC numbers related to Coal is found the SCC column of the extract. 
## Step 2: Check is the SCC in the Emissions list is in the SCC group and extract the line if so. 

coalClss <- sourceClassification[grepl("Coal", sourceClassification$Short.Name),]
coalEmissions <- summaryEmissions[summaryEmissions$SCC %in% coalClss$SCC, ]

## sum up emissions by year
coalbyYear <- aggregate(coalEmissions$Emissions, by=list(coalEmissions$year), FUN=sum)
colnames(coalbyYear) <- c("year", "emissions")

## create a plot showing coal related emissions from 1999-2008
png(filename = "plot4.png")
plot(coalbyYear$year, coalbyYear$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Emissions of PM2.5 in US")
dev.off()
