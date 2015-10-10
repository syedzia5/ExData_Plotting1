# This function plots the Plot 3 of the project 1
# requires following files in the working directory
# 	1. downloadDataFile.R
# 	2. proj1utils.R

plot3 <- function()
{
	if(!exists("downloadDataFile") | !exists("loadProj1Data"))
	{
		source("downloadDataFile.R")
	}
	if(!exists("plot3Lines"))
	{
		source("proj1utils.R")
	}

	lddata <- loadProj1Data()  # loadProj1Data() defined in downloadDataFile.R
	
	png(filename = "plot3.png")

	plot3Lines(lddata) #This function is defined in proj1utils.R
	
	dev.off()
}
