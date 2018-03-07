#######################################################################################################################
# 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
#######################################################################################################################

##Read unzipped datasets
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

##Subset motor vehicle data from Baltimore and LA
library(dplyr)
library(ggplot2)
baltimore_LA <- filter(NEI, fips == "24510"& type == "ON-ROAD"|fips == "06037" & type =="ON-ROAD")
combine_fips <- aggregate(Emissions~year + fips, baltimore_LA, sum)
combine_fips$fips[combine_fips$fips == "24510"] <- "Baltimore"
combine_fips$fips[combine_fips$fips == "06037"] <- "Los Angeles"

##Make a graph and save in PNG file
png(filename = 'Plot6.png', height=480, width=650)
g <- ggplot(combine_fips, aes(factor(year), Emissions))
plot6 <- g + geom_bar(stat="identity") + facet_grid(.~fips) +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]* "Emissions from Motor Vehicle Source in Baltimore vs Los Angeles (1999-2008)"))
print(plot6)
dev.off()