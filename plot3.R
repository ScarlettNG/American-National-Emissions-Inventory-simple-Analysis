# Load the 2 files provided in 

SCC_PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources 
# have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the 
# ggplot2 plotting system to make a plot answer this question.

# Create a subset for Baltimore City only 
baltimore <- subset(SCC_PM25, fips == '24510')

# Plot the emission for Baltimore based on type 

ggplot(baltimore, aes(x=factor(year), y=Emissions, fill=type)) + geom_bar(stat='identity') +
        facet_grid(.~type) + xlab('Year') +ylab('Pm25 Emissions (in tons)') +
        ggtitle('Pm25 Emissions in Baltimore')

# For Baltimore, the emission for non-road, non-point and on-road type decreased. 
# Meanwhile, emission for point type fluctuates up and down.

dev.copy(png, 'plot3.png', width=480, height=480)
dev.off()