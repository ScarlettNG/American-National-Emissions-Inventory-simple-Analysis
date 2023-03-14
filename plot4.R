# Load the 2 files provided in 

SCC_PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

# In the SCC data, we can see 4levels of coal combustion-related source
# Create a subset for those related data

combust <- SCC[grepl('Comb.*Coal', SCC$EI.Sector), 'SCC']

# Calculate the total emissions from coal combustion-related sources

combust_pm25 <- SCC_PM25[(SCC_PM25$SCC %in% combust),]

combust_emis <- aggregate(Emissions ~ year, combust_pm25, sum)

ggplot(combust_emis, aes(factor(year), y=round(Emissions/1000,2), label=round(Emissions/1000,2), fill=year)) +
        geom_bar(stat='identity') + xlab('Year') + ylab('Pm25 Emissions in Tons') +
        ggtitle('Coal Combustion-related Emissions (1999 - 2008)') +
        geom_label(aes(fill=year), fontface='bold') +
        ylim(c(0, 620)) + theme_light() 

# Coal combustion related emission were peaking from 1999 to 2005 and decreased significantly in 2008

dev.copy(png, 'plot4.png', width=480, height=480)
dev.off()