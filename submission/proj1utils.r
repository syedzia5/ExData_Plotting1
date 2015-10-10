#
# 
# In all the functions below, lddata should be a data.frame that contains the data that has to be used for plotting
#
#
# This function plots the histogram of plot 1 of project1
plot1Hist<-function(lddata)
{
	hist(lddata$Global_active_power,main = "Global Active Power", xlab = "Globa Active Power (kilowatts)", ylab = "Frequency", col = "red")
}

# This functions plots the 'Plot 2' of project 1, also called by plot4() 
# in plot4.R to plot the [1,1] plot of 'Plot 4' of project 1
plot2Lines<-function(lddata, maintxt = "2 Day Time Wise Global Active Power (kilowatts)")
{
	with(
		lddata,
			{
				plot(DateTime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "datetime", main = maintxt)
				lines(DateTime, Global_active_power)
			}
		)
}
# This functions plots the 'Plot 3' of project 1, also called by plot4() 
# in plot4.R to plot the [2,1] plot of 'Plot 4' of project 1

plot3Lines<-function(lddata, maintxt = "2 Day Time Wise Energy sub metering")
{
	with(
		lddata,
			{
				plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "datetime", main = maintxt)
				lines(DateTime, Sub_metering_1, col = "black")
				lines(DateTime, Sub_metering_2, col = "red")
				lines(DateTime, Sub_metering_3, col = "blue")
				legend("topright", lty = 1, col = c("black", "red" , "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
			}
		)
}

# This function called by plot4() in plot4.R to plot the [1,2] plot of 'Plot 4' of project 1

plot4_3_Lines <-function(lddata, maintxt = "2 Day Time Wise Voltage")
{
	with(
		lddata,
			{
				plot(DateTime, Voltage, type = "n", ylab = "Voltage", xlab = "datetime", main = maintxt)
				lines(DateTime, Voltage, col = "black")
			}
		)
}

# This function called by plot4() in plot4.R to plot the [2,2] plot of 'Plot 4' of project 1
plot4_4_Lines <-function(lddata, maintxt = "2 Day Time Wise Global reactive power")
{
	with(
		lddata,
			{
				plot(DateTime, Global_reactive_power, type = "n",  ylab = "Global reactive power", xlab = "datetime", main = maintxt)
				lines(DateTime, Global_reactive_power, col = "black")
			}
		)
}
