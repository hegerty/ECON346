###############################################################################
# Economics 346, NEIU
# Show some modifications: 
# Line type, width, color; headers, axis labels; 
# legends will come later 
###############################################################################

#You will need to Google the choices (point type, color, line type)
#ggplot2 is great for visualization; here is more basic

#Inflation rates for Japan, Canada, UK, US
#Import  CPI; create log difference series
data1<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/Lab2levelsData.csv",header=TRUE)
data1<-data1[,-c(2:5)]
data1<-as.matrix(data1)
inf<-100*diff(log(data1[,2:5]))
colnames(inf)<-c("JPINF","CNINF","UKINF","USINF")
inf<-cbind(data1[-1,1],inf)


#histogram of U.S. inflation: Change x-axis label
hist(inf[,5])
hist(inf[,5],xlab="U.S. Inflation",main="U.S. Inflation")


#stripchart with dots

stripchart(inf[,5])
stripchart(inf[,5],pch=20)
#make smaller, and green; add x-axis 
stripchart(inf[,5],pch=20,cex=.1,col="green",xlab="U.S. Annual Inflation Distribution, 1970-2017")

#try a scatterplot
plot(inf[,2],inf[,3])
#Change parameters: Shape, size, color
plot(inf[,2],inf[,3],ylab="Canada",xlab="Japan",pch=15,cex=1.5,col="#CFCFCF")
plot(inf[,2],inf[,3],ylab="Canada",xlab="Japan",pch=20,cex=2,col="#CFCFCF",main="Inflation Correlations, 1970-2017")
#add a regression line
abline(lm(inf[,3]~inf[,2]))
#add a horizontal line just to do it
abline(h=5)
#and a vertical line
abline(v=6)

#now repeat with a dashed, thicker regression line
plot(inf[,2],inf[,3],ylab="Canada",xlab="Japan",pch=20,cex=2,col="#CFCFCF",main="Inflation Correlations, 1970-2017")
abline(lm(inf[,3]~inf[,2]),lwd=2,lty=5)

#Try a time-series plot of CPI
ts.plot(data1[,2:5])
#Question: What is the base year?
#QUESTION: Try re-plotting CPI with the colors as red, blue, green, grey; and each with a different width and line type
