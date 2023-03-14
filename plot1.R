# Load the 2 files provided in 

SCC_PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Check the summary for each data
summary(SCC_PM25)
summary(SCC)

total_emis <- aggregate(Emissions ~ year, SCC_PM25, sum)

barplot(total_emis$Emissions/10^6, names.arg = total_emis$year, 
        col = c('black','red','green','blue'),
        xlab = 'Year',
        ylab = 'Pm25 emission (in tons)',
        main = 'Total pm25 emission from all US source (1999 - 2008)')

# It is clearly to see that the total pm25 emission did decrease in the 1999 to 2008
# time range

dev.copy(png, 'plot1.png', width=480, height=480)
dev.off()