# Coursera Exploratory Data Analysis Project 2
For this project, we focused on the Environmental Protection Agency (EPA) National Emitions Inventory database on fine particulate matter (PM2.5), which is an air pollutant that is extremely harmful to human health. The main goal is to explore this database, and answer the following questions by creating plots. 

1.	Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2.	Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (`fips == "24510"`) from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3.	Of the four types of sources indicated by the `type` (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4.	Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5.	How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6.	Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (`fips == "06037"`). Which city has seen greater changes over time in motor vehicle emissions?

Data was downloaded from this [link](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip).
This zipfile contains two datasets:
1. *summarySCC_PM25.rds*: all the data frame with all of the PM2.5 emission data (calculated in **tons**) for 1999, 2002, 2005, 2008.
2. *Source_Classification_code.rds*: provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. 
