setwd("C:/Users/David/Desktop/ExplorProj2")
library(ggplot2)
library(plyr)

# Reads in data from local file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Takes Baltimore only
Baltimore <- subset(NEI, fips == "24510")
typeEmissionByYear <- ddply(Baltimore, .(year, type), function(x) sum(x$Emissions))
colnames(typeEmissionByYear)[3] <- "Emissions"

# Plots line graph
png("Plot3.png")

qplot(year, Emissions, data=typeEmissionByYear, color=type, geom="line") +
  ggtitle(expression("Baltimore Emissions by Source & Year")) +
  xlab("Year") +
  ylab(expression("Total Emissions"))

dev.off()