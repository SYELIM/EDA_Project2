################################################################################################
# 5. How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?
################################################################################################

##Read unzipped datasets
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

##Subset motor vehicle data from Baltimore
library(dplyr)
library(ggplot2)
baltimore <- filter(NEI, fips == "24510" & type =="ON-ROAD")
combine_data <- aggregate(Emissions~year, baltimore, sum)

##Make a graph and save in PNG file
png(filename = 'Plot5.png', height=480, width=650)
g <- ggplot(combine_data, aes(factor(year), Emissions))
plot5 <- g + geom_bar(stat="identity") + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]* "Emissions from Motor Vehicle Source in Baltimore (1999-2008)"))
print(plot5)
dev.off()