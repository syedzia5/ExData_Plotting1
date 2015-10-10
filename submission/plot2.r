# This function plots the Plot 2 of the project 1
# requires following files in the working directory
# 	1. downloadDataFile.R
# 	2. proj1utils.R

plot2 <- function()
{
	if(!exists("downloadDataFile") | !exists("loadProj1Data"))
	{
		source("downloadDataFile.R")
	}
	if(!exists("plot2Lines"))
	{
		source("proj1utils.R")
	}
	
	lddata <- loadProj1Data()  # loadProj1Data() defined in downloadDataFile.R
	png(filename = "plot2.png")

	plot2Lines(lddata) #This function is defined in proj1utils.R
	
	dev.off()
}
