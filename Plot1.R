setwd("C:/Users/David/Desktop/ExplorProj2")

# Reads in data from local file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Sums PM2.5 by year
totalEmissionsByYear <- tapply(NEI$Emissions, NEI$year, sum)

# Plots line graph
png("Plot1.png")
plot(names(totalEmissionsByYear), totalEmissionsByYear, type="l",
     xlab="Year", ylab=expression("Total Yearly PM"[2.5]),
     main=expression("Total" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()