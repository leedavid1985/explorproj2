setwd("C:/Users/David/Desktop/ExplorProj2")

# Reads in data from local file
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Takes Baltimore only
Baltimore <- subset(NEI, fips == "24510")
totalEmissionsByYear <- tapply(Baltimore$Emissions, Baltimore$year, sum)

# Plots line graph
png("Plot2.png")
plot(names(totalEmissionsByYear), totalEmissionsByYear, type="l",
     xlab="Year", ylab=expression("Total Yearly Baltimore PM"[2.5]),
     main=expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"))
dev.off()