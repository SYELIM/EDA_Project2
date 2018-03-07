##########################################################################################################################
#  2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#  Use the base plotting system to make a plot answering this question.
##########################################################################################################################


##Read unzipped datasets
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

##Subset data for Baltimore City
library(dplyr)
baltimore <- filter(NEI, fips == "24510")
plot_2 <- tapply(baltimore$Emissions, baltimore$year, sum)

##Make a graph and save in PNG file
png(filename = 'Plot2.png', height=480, width=480)
barplot(plot_2, xlab="Year", ylab = "Emissions (ton)", main= "Total PM2.5 Emissions in Baltimore City", col = "#009999")
dev.off()