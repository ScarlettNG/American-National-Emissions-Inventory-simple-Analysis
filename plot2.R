# Load the 2 files provided in 

SCC_PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (
# fips == "24510") from 1999 to 2008? Use the base plotting system 
# to make a plot answering this question.

# Create a subset for Baltimore City only 
baltimore <- subset(SCC_PM25, fips == '24510')

balt_emis <- aggregate(Emissions ~ year, baltimore, sum)

barplot(balt_emis$Emissions, names.arg = balt_emis$year, 
        col = 'darkblue',
        xlab = 'Year',
        ylab = 'Pm25 emission (in tons)',
        main = 'Total pm25 emission from Baltimore, Maryland (1999 - 2008)')

# In Baltimore, there was a decrease in pm25 emission during 1999 and 2002, 
# when it rose again in 2005 and dropped in 2008.

dev.copy(png, 'plot2.png', width=480, height=480)
dev.off()