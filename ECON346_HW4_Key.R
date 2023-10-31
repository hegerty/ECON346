##############################################
## ECON 346 HW4 Key F23 
###############################################

#Load data from website: Source: IFS + Calculations
data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/ECON346_GrowthRates.csv")
head(data)

# Calculate means (could also use apply)
means<-colMeans(data[,-1])
means
max(means)-min(means)

# Select two columns (SA, JP)
# Get t-test w/command--including df
v1<-data[,2]
v2<-data[,4]
df<-nrow(data)-1
t.test(v1,v2)

# now use formula
m1<-mean(v1)
m2<-mean(v2)
var1<-var(v1)
var2<-var(v2)

t1<-(m1-m2)/sqrt((var1/nrow(data)+var2/nrow(data)))
t1
qt(0.95,df)

# ratio of variances: largest on top
varratio<-var1/var2
varratio
qf(.95,df,df)

##BONUS
# a few different ways
rbind(apply(data[-1],2,FUN=mean),apply(data[-1],2,FUN=var))

which.max(apply(data[-1],2,FUN=mean))
which.max(apply(data[-1],2,FUN=var))

which.max(apply(data[-1],2,FUN=mean))==which.max(apply(data[-1],2,FUN=var))

which.min(apply(data[-1],2,FUN=mean))
which.min(apply(data[-1],2,FUN=var))

which.min(apply(data[-1],2,FUN=mean))==which.min(apply(data[-1],2,FUN=var))

