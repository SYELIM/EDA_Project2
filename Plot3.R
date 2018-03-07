###########################################################################################################
#    3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#    Which of these four sources have seen decreases in emissions from 1999???2008 for Baltimore City? 
#    Which have seen increases in emissions from 1999???2008? 
#    Use the ggplot2 plotting system to make a plot answer this question.
###########################################################################################################

##Read unzipped datasets
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_code.rds")

##Subset data for Baltimore City
library(dplyr)
library(ggplot2)
plot_3 <- summarize(group_by(filter(NEI, fips == "24510"), year, type), Emissions=sum(Emissions))

##Make a graph and save in PNG file
png(filename = 'Plot3.png', height=480, width=650)
g <- ggplot(plot_3, aes(factor(year), Emissions, color= type))
plot3 <- g + geom_bar(aes(fill=type),stat="identity") + facet_grid(.~type) + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions in Baltimore (1999-2008) by source type"))
print(plot3)
dev.off()

