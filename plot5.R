setwd("D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02")

if (!"NEI" %in% ls()) {
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]


baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]


## Loading the required library
library(ggplot2)

png(filename = "D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02/Ex_Data_CourseProject2/figures/plot5.png",
    width=480,height=480,
    units="px",
    bg="transparent")

ggp <- ggplot(baltimoreVehiclesNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()
