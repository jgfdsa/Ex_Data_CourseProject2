setwd("D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02")

if (!"NEI" %in% ls()) {
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- NEI[NEI$fips=="24510",]
TotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png(filename = "D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02/Ex_Data_CourseProject2/figures/plot2.png",
    width=480,height=480,
    units="px",
    bg="transparent")

barplot(
        TotalsBaltimore$Emissions,
        names.arg=TotalsBaltimore$year,
        xlab="Year",
        ylab="PM2.5 Emissions (Tons)",
        main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()
