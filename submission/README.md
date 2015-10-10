This readme describes the project 1 submission of the Exploratory Data Analysis course.

All the code files that have been submitted should be copied and run from the working directory.

All the plot*.png file are created in the working directory.

The submission consists of following 11 files:

1. README.md
   Which is this file and describes, in brief, the submitted files

2. downloadDataFile.R
	This downloads the data file from the URL mentioned on the project page. 
	The file should be in the same it contains following 2 functions(please see the code file for details of function):
	(a) downloadDataFile(): This downloads the data file
	(b) loadProj1Data(): Reads the downloaded data file, extracts data for 01-Feb-2007 & 02-Feb-2007 
		and returns the extracted data as a data.frame

3. proj1utils.r
	This file contains plotting functions that are called from the other major plot*.R files.
	It contains following functions(please see the code file for details of function):
	1. plot1Hist(): This plots the histogram of plot1.png
	2. plot2Lines(): This plots the plot2.png and [1,1] plot of plot4.png
	3. plot3Lines(): This plots the plot3.png and [2,1] plot of plot4.png
	4. plot4_3_Lines(): This plots the [1,2] plot of plot4.png
	5. plot4_4_Lines(): This plots the [2,2] plot of plot4.png

4. plot1.r
	This file contains the main function plot1() that is responsible for generating plot1.png. 
	
5. plot2.r
	This file contains the main function plot2() that is responsible for generating plot2.png. 

6. plot3.r
	This file contains the main function plot1() that is responsible for generating plot3.png. 

7. plot4.r
	This file contains the main function plot1() that is responsible for generating plot4.png. 

Due to time constrain could do only this far, however there is scope for a lot of improvement :)
