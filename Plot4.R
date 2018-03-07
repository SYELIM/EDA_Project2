####################################################################################################################
#  4. Across the United States, how have emissions from coal combustion-related sources changed from 1999???2008?
####################################################################################################################


##Read unzipped datasets
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

##Merge NEI and SCC
NEISCC <- merge(NEI, SCC, by="SCC")

##Subset coal combustion related sources
coal_source <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
NEISCC_subset <- NEISCC[coal_source, ]

combine_data <- aggregate(Emissions~year, NEISCC_subset, sum)
library(ggplot2)


##Make a graph and save in PNG file
png(filename = 'Plot4.png', height=480, width=650)
g <- ggplot(combine_data, aes(factor(year), Emissions))
plot4 <- g + geom_bar(stat="identity") + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]* "Emissions from Coal Combustion-related Sources (1999-2008)"))
print(plot4)
dev.off()