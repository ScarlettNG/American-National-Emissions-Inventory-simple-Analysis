# Load the 2 files provided in 

SCC_PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City?

# Extract the data where it contains the word 'vehicle'
vehicle <- SCC[grepl('[Vv]ehicle', SCC$EI.Sector), 'SCC']

vehicle_pm25 <- SCC_PM25[(SCC_PM25$SCC %in% vehicle),]
vehicle_emis <- subset(vehicle_pm25, fips == '24510')
        
ggplot(vehicle_emis, aes(x=factor(year), y=Emissions, label=round(Emissions))) +
        geom_bar(stat='identity', fill='blue') +
        xlab('Year') + ylab('Pm25 Emissions in Tons') +
        ggtitle('Vehicle Emissions in Baltimore (1999 - 2008)') +
        theme_light() +
        theme(plot.title = element_text(hjust = 0.5))

# The emission from vehicles in Baltimore significantly decrease by half
# from 1999 to 2008

dev.copy(png, 'plot5.png', width=720, height=720)
dev.off()