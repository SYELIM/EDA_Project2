#####################################################################################################
#  1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#  Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
#  for each of the years 1999, 2002, 2005, and 2008.
#####################################################################################################

##Read unzipped datasets
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

##Get data for year 1999, 2002, 2005 and 2008
plot_1 <- tapply(NEI$Emissions, NEI$year, sum)

##Make a graph and save in PNG file
png(filename = 'Plot1.png', height=480, width=480)
barplot(plot_1, xlab="Year", ylab = "Emissions (ton)", main= "Total PM2.5 Emissions", col = "#009999")
dev.off()
