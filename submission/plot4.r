# This function plots the Plot 4 of the project 1
# requires following files in the working directory
# 	1. downloadDataFile.R
# 	2. proj1utils.R

plot4 <- function()
{
	if(!exists("downloadDataFile") | !exists("loadProj1Data"))
	{
		source("downloadDataFile.R")
	}
	
	if(!exists("plot2Lines") | !exists("plot3Lines") | !exists("plot4_3_Lines") | !exists("plot4_4_Lines"))
	{
		source("proj1utils.R")
	}

	lddata <- loadProj1Data() # loadProj1Data() defined in downloadDataFile.R
	
	png(filename = "plot4.png")
	
	par(mfcol = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
	
	#These functions are defined in proj1utils.R
	plot2Lines(lddata, "Global Active Power (kilowatts)")
	plot3Lines(lddata, "Energy sub metering")
	plot4_3_Lines(lddata,"Voltage")
	plot4_4_Lines(lddata, "Global reactive power")
	mtext("2 Day Energy Consumption", outer = TRUE)
	dev.off()
}
