setwd("D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02")

if (!"NEI" %in% ls()) {
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

baltimoreNEI <- NEI[NEI$fips=="24510",]


## Loading the required library
library(ggplot2)

png(filename = "D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02/Ex_Data_CourseProject2/figures/plot3.png",
    width=480,height=480,
    units="px",
    bg="transparent")

ggp <- ggplot(baltimoreNEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(ggp)

dev.off()
