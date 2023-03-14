# Load the 2 files provided in 

SCC_PM25 <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Compare emissions from motor vehicle sources in Baltimore City with emissions from 
# motor vehicle sources in Los Angeles County, California (
# fips == "06037"). Which city has seen greater changes 
# over time in motor vehicle emissions?


# Create a data frame for Baltimore and California
vehi <- grepl("[Vv]ehicle", SCC$EI.Sector, ignore.case=TRUE)
vehi_scc <- SCC[vehicle,]$SCC
merge_vehi <- SCC_PM25[SCC_PM25$SCC %in% vehi_scc,]

# Subset the vehicles NEI data by each city's fip and add city name.
balti <- merge_vehi[merge_vehi$fips=="24510",]
balti$city <- "Baltimore City"

cali <- merge_vehi[merge_vehi$fips=="06037",]
cali$city <- "Los Angeles County"

cali_balti <- rbind(balti,cali)

ggplot(cali_balti, aes(x=factor(year), y=Emissions, fill=city, label=Emissions)) +
        geom_bar(aes(fill=year), stat='identity') +
        facet_grid(.~city) +
        labs(x='Year', y='Pm25 Emissions in Tons', title = 'Vehicle Emissions in Baltimore and California (1999 - 2008)') +
        theme_light()

# The emission from vehicles in LA was about 4 times higher than that in Baltimore City.

dev.copy(png, 'plot6.png', width=720, height=720)
dev.off()