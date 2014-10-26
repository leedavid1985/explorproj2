setwd("C:/Users/David/Desktop/ExplorProj2")
library(ggplot2)
library(plyr)

# Reads in data from local file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Takes Coal data only
coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
merged <- merge(x=NEI, y=coal, by="SCC")
merged2 <- aggregate(merged[, "Emissions"], by=list(merged$year), sum)
colnames(merged2) <- c("Year", "Emissions")

# Plots line graph
png("Plot4.png")

qplot(Year, Emissions, data=merged2, geom="line") +
  ggtitle(expression("Coal Emissions by Year")) +
  xlab("Year") +
  ylab(expression("Coal Emissions"))

dev.off()