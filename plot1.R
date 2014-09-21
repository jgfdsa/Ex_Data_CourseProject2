setwd("D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02")

if (!"NEI" %in% ls()) {
        NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if (!"SCC" %in% ls()) {
        SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Aggregate by sum the total emissions by year
Totals <- aggregate(Emissions ~ year,NEI, sum)

png(filename = "D:/COURSES/Coursera/04_Exploratory Data Analysis/Assigment 02/Ex_Data_CourseProject2/figures/plot1.png",
    width=480,height=480,
    units="px",
    bg="transparent")

barplot(
        (Totals$Emissions)/10^6,
        names.arg=Totals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All US Sources"
)

dev.off()
