########################################
# ECON 346: Lab 2
# Creating the (main) Growth Rate Data
########################################

#Take levels Nominal GDP and CPI for four countries: Canada, Japan, UK, US
#Make real GDP and growth rate
#I am going to do this step-by-step so it is more intuitive
#I will try this a couple of different ways
#Not really treating these as time series, yet

setwd("I:/ECON346")
#Load data from my website: Source: IFS
data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/Lab2levelsData.csv",header=TRUE)
head(data)
CNRY<-100*data$CNY/data$CNP
JPRY<-100*data[,3]/data[,7]
attach(data)
UKRY<-100*UKY/UKP
USRY<-100*USY/USP
detach(data)

#Now make a set of all 4 real GDPs (Include the year)
RY<-cbind(data[,1],CNRY,JPRY,UKRY,USRY)
head(RY)

#Taking log differences as percentage change
#Note multi-step calculation
growth<-100*diff(log(RY))
head(growth)
#replace Year
#But growth is one observation shorter!
#Drop first observation (negative sign, first observation/row)
#give a column name just to first column
growth[,1]<-data[,1]
growth[,1]<-data[-1,1]
colnames(growth)
colnames(growth)[1]<-"Year"
head(growth)

#Write to CSV
write.csv(growth,"growth.csv")
