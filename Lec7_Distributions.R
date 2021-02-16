##############################################################
# ECON 346: Distributions
##############################################################

##Here: Normal, t, F
###Also note the coding and data visualization

#Generate 1 million random observations
#Normal distribution
#mean=0, sd = 1
#Notice I rename the object for use later
n1<-rnorm(1000000,0,1)
#50 selected randomly in the middle
n1[111111:111160]
normd<-n1
#plot with a histogram--here, 100 bins
hist(normd,100)
#try 1000 bins
hist(normd,1000)
#calculate percentile values: should match a stats textbook
q1<-quantile(normd,probs = c(0.01,0.025,0.05,0.10,0.25,0.5,0.75,0.9,0.95,0.975,0.99))
q1
round(q1,3)

#now find values that exceed 0.975
#find the position in the quantile list
length(q1)
normd[which(normd>=q1[10])]
#Question: How could you "skip" this step and not have to look up this number?

#How many are there?
length(normd[which(normd>=q1[10])])
#What percent of the total is this?
100*length(normd[which(normd>=q1[10])])/length(normd)
#How many exceed 1.15?
100*length(normd[which(normd>=1.15)])/length(normd)
#How many are less than zero?
100*length(normd[which(normd<0)])/length(normd)
#No surprise -- it's half 

#Plot it nicer: Axes, titles, extra lines
hist(normd,1000,probability = TRUE,xlab="Value",main="Normal Distribution")
#add vertical lines at 0.025 and 0.975
abline(v=quantile(normd,probs = c(0.025,0.975)),col="grey",lty=2)
#add a legend for the lines
legend("topright",legend = "5% 2-sided CVs",lty=2,col="grey",box.col="white")

#repeat with mean =10, sd=35
n2<-rnorm(1000000,10,35)
normd<-n2
hist(normd,1000,probability = TRUE,xlab="Value",main="Normal Distribution")
#add vertical lines at 0.025 and 0.975
abline(v=quantile(normd,probs = c(0.025,0.975)),col="grey",lty=2)
#add a legend for the lines
legend("topleft",legend = "5% 2-sided CVs",lty=2,col="grey",box.col="white")

#Generate t-distribution with 1 million observations, 25 degrees of freedom
td<-rt(1000000,25)
hist(td,1000,probability = TRUE,xlab="Value",main="T Distribution")
#add vertical lines at 0.025 and 0.975
abline(v=quantile(td,probs = c(0.025,0.975)),col="grey",lty=2)
#add a legend for the lines
legend("topleft",legend = "5% 2-sided CVs",lty=2,col="grey",box.col="white")

#Note critical values
quantile(td,probs = c(0.025,0.975))


         
#Generate t-distribution with 1 million observations, 250 degrees of freedom
td2<-rt(1000000,250)
hist(td2,1000,probability = TRUE,xlab="Value",main="T Distribution")
#add vertical lines at 0.025 and 0.975
abline(v=quantile(td2,probs = c(0.025,0.975)),col="grey",lty=2)
#add a legend for the lines
legend("topleft",legend = "5% 2-sided CVs",lty=2,col="grey",box.col="white")

#Note critical values
quantile(td2,probs = c(0.025,0.975))
                  
#Assignment: Generate 1000000 values for a t-distribuion with 2500 degrees of freedom. How do these two critical values compare to the Normal distribution and to the values when degrees of freedom are 25 and 250?  

# One more: F distribution w/ 5, 50 df, 1000 obs
f<-rf(1000,5,50)
f1<-f
hist(f1,100,probability = TRUE,xlab="Value",main="F Distribution")
#add vertical line at 0.95
abline(v=quantile(f1,probs = 0.95),col="grey",lty=2)
#add a legend for the lines
legend("topright",legend = "5% 1-sided CV",lty=2,col="grey",box.col="white")
quantile(f1,probs = 0.95)


#Bonus assignment: Try this with dfs of 50,50