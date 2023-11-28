###########################################################
##
## KEY: ECON 346 F23
## HW6
##
###########################################################

data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/HW6_Data_F23.csv")
head(data)
data[,1]->dates

#Q1
data<-data[,-1]
data<-ts(data,start=c(1959,1),frequency = 4)

#Q2
ts.plot(data,lwd=c(2,2),col=c("black","dark grey"),lty=c(1,3),main="Nominal GDP and Consumption",xlab="")
#Q3
legend("topleft",legend=colnames(data),lwd=c(2,2),col=c("black","dark grey"),lty=c(1,3),bty="n")

#Q4
#Control for Prices
#Q5 No visible fluctuations

#Q6
cyratio=100*data[,2]/data[,1]

#Q7
mean(cyratio)
min(cyratio)
dates[which.min(cyratio)]
max(cyratio)
dates[which.max(cyratio)]

#Q8
ts.plot(cyratio,main="C/Y Ratio",xlab="",ylab="")
abline(h=mean(cyratio),lty=2,col="dark grey")

#Q9
dcyratio=diff(cyratio)
lcyratio=lag(cyratio,-1)

cydata<-cbind(cyratio,lcyratio,dcyratio)
head(cydata)

#BONUS
reg1<-lm(cyratio~lcyratio,data=cydata)
summary(reg1)
PP.test(cyratio)
# this ratio is likely nonstationary

####
##This is extra: Not on the assignment
#####

#Make a trend; I am doing it this way
trend=rep(1,nrow(data))
trend=cumsum(trend)
trend

#new dataframe with trend
data2<-cbind(data,trend)
#rename new columns
colnames(data2)[c(1,2)]=colnames(data)
#run regression
reg2<-lm(PCE~GDP+trend,data=data2)
summary(reg2)

