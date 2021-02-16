###############################################
#Economics 346, NEIU
#Show some basic graph types (Base R package)
###############################################

#Generate some simple data
data<-c(2200, 155, 1821)
names(data)
names(data)<-c("x","y","z")
pie(data)

pie(data,col=c("black","grey","darkgrey"))

#make the colors their own object!
col1<-c("black","grey","darkgrey")
pie(data,col=col1)

#Question: Make a pie chart with the numbers 34, 51, 101, 128 in the colors red, green, brown, and blue

#Try a bar plot
barplot(data)

#Now try a real data series
#Inflation rates for Japan, Canada, UK, US
#Import  CPI; create log difference series
data1<-read.csv("https://sites.google.com/site/swhegerty/macroeconomic-data-analysis/Lab2levelsData.csv",header=TRUE)
data1<-data1[,-c(2:5)]
data1<-as.matrix(data1)
inf<-100*diff(log(data1[,2:5]))
colnames(inf)<-c("JPINF","CNINF","UKINF","USINF")
inf<-cbind(data1[-1,1],inf)

#histogram of U.S. inflation
hist(inf[,5])
#make it with 10 bins (9 breaks)
hist(inf[,5],breaks = 10)
#Check the quantiles
summary(inf[,5])

#boxplot: Median + quantiles
boxplot(inf[,5])
#do for all four countries
boxplot(inf[,2:5])

#stripchart shows some interesting distributions
stripchart(inf[,5])
