setwd("C:/Users/David/Desktop/ExplorProj2")
library(ggplot2)
library(plyr)

# Reads in data from local file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Takes motor vehicle data only
onroad <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
onroad <- transform(onroad,city = ifelse(fips == "24510", "Baltimore", "LA"))
onroadByYear <- ddply(onroad, .(year,city), function(x) sum(x$Emissions))
colnames(onroadByYear)[3] <- "Emissions"

# Plots line graph
png("Plot6.png")

qplot(year, Emissions, data=onroadByYear, color=city, geom="line") +
  ggtitle(expression("City Vehicle Emissions by Year")) +
  xlab("Year") +
  ylab(expression("Vehicle Emissions"))

dev.off()