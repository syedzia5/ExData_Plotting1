#downloadDataFile: if 'filename' does not exists in 'dir', it downloads and extract the file 'filename' from the zip file
#					represented by link 'url'. The file is extracted in the directory 'dir' 
#					default value for 'dir' is current working directory

downloadDataFile <- function(url,filename, dir = getwd()) {
	# message ("In downloadDataFile: ", url,", ", filename,", ", dir)
	fullfn <- paste(dir,filename, sep ="/")
	if(!file.exists(fullfn))
	{
		zipflnm <- paste(dir,"dnld.zip")
		download.file(url, zipflnm)
		unzip(zipflnm, exdir = dir)
	}
	
	file(fullfn, "r")
}

#loadProj1Data: This function downloads the project 1 data file and loads returns a data frame containing 
#				the records of 1st and 2nd February 2007
#				A peek into the data file revealed that the records in the data file are sorted by 'Date' field
#				This function takes advantage of this fact. If the records are not sorted then
#				The this function might return incomplete data
loadProj1Data <- function()
{
	# Download the data file
	cn <- downloadDataFile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
						   "household_power_consumption.txt")

	# Read the header line, these will become column names for the returned data frame
	clmnms <- unlist(strsplit(readLines(cn, n = 1), ";"))
	
	#clmnms
	
	datf <- data.frame()
	
	#flags & counters .....
	gf <- FALSE #Set to TRUE when first record of data: 1st Feb 2007 is read
	nrc = 0 #Counter to display count number of records read and displat the same 
	whlcond <- TRUE #while loop condition, is set to False:
					#if :
					#	EOF reached
					#	first record of 3rd Feb 2007 encounterd
	
	#start getting data
	while(whlcond)
	{
		if(length(nwln <- readLines(cn, n = 1)) <= 0) #EOF reached?
		{
			whlcond <- FALSE
			next
		}
		nwln <- strsplit(nwln,";")
		if(as.Date(nwln[[1]][1], "%d/%m/%Y") <= "2007-01-31")
		{
			next
		}
		if(as.Date(nwln[[1]][1], "%d/%m/%Y") >= "2007-02-03") #after peeking in the file and found that records are date sorted
															  #if records are not date sorted then this won't work
		{
			message(nrc," records loaded, last record loaded: ", nwln)
			whlcond <- FALSE
			next
		}
		if(!gf){
			message("got first record")
			gf <- TRUE
		}
		nrc = nrc + 1
		if(nrc%%500 == 0)
		{
			message(nrc," records loaded, last record loaded: ", nwln)
		}
		
		datf <- rbind(datf, matrix(unlist(nwln), nrow = 1, ncol = 9))
	}
	close(cn)
	colnames(datf) <- clmnms
	datf$DateTime <- strptime(paste(datf$Date, datf$Time, " "), "%d/%m/%Y %H:%M:%S")
	
	# Convert measurement data to double
	datf[,3:9] <-  lapply(datf[,3:9,drop=FALSE],as.character)
	datf[,3:9] <-  lapply(datf[,3:9,drop=FALSE],as.double)
	
	#return the data
	datf
}