setwd("D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02")

if (!"NEI" %in% ls()) {
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalCombustion <- (combustionRelated & coalRelated)
combustionSCC <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]


## Loading the required library
library(ggplot2)

png(filename = "D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02/Ex_Data_CourseProject2/figures/plot4.png",
    width=480,height=480,
    units="px",
    bg="transparent")

ggp <- ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity",fill="grey",width=0.75) +
        theme_bw() +  guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

print(ggp)

dev.off()
