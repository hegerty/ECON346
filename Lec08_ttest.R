#################################
# ECON 346 Lab: T-Test example
#################################

#Open data and make inflation rates
data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/Lab2levelsData.csv",header=TRUE)
data<-as.matrix(data)
inf<-100*diff(log(data[,6:9]))
inf<-as.data.frame(cbind(data[-1,1],inf))
head(inf)
#Note that US inflation data is awfully high in 1974
#What is the t-statstic?
mean(inf[,5])
inf[5,5]-mean(inf[,5])
sd(inf[,5])
#take the ratio
#Remember parentheses!
(inf[5,5]-mean(inf[,5]))/sd(inf[,5])
#Compare to critical value
#N > 30, so close to Z c.v.
qt(p = 0.975,df = 47)

############################################
#Do some tests on US inflation data
#Split sample based on disinflation
US<-inf$USP

#Calculate summary stats
#Examine distribution
mean(US)
sd(US)
length(US)
hist(US,(22-11))

#Plot as a time series
plot(inf[,1],US,type="l",xlab="")
#pre- and post- 1981
#Examine data for drop
#Split into pre and post

#Choose an end point based on data
#Graph and data matrix
#Coded so it only needs to be entered once

inf[,c(1,5)]
end<-11
USpre<-US[1:end]
USpost<-US[(end+1):length(US)]
#Why not add a vertical line?
abline(v=inf[end,1],lty=3,col="dark grey",lwd=2)

#Summary stats
mean(USpre)
mean(USpost)
sd(USpre)
sd(USpost)
length(USpre)
length(USpost)


####
#T-Test
#Two ways: R function and step-by-step using formula
#Note degrees of freedom used (based on formula)
#Same answer both ways

t1<-t.test(USpre,USpost,var.equal = FALSE)
t1

t2<-(mean(USpre)-mean(USpost))/sqrt((var(USpre)/length(USpre))+(var(USpost)/length(USpost)))
t2
#Assignment: Try this for Canadian inflation rates, with the split ocurring after 1990
