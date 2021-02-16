#########################################################
# ECON 346, NEIU
# Regression Example: Zipf's Law (The "Rank-Size" Rule)
# NYC's population should be 2x LA's and 3x Chicago's
# Rank*Size = k
#########################################################

#ln(Rank) = a - b*ln(Size)
#Does it hold in practice?

##Use provided data
#US CENSUS American Community Survey 5-year estimates, 2017
##More at factfinder.census.gov
data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/PlaceData2017.csv",header=TRUE)
head(data)
dim(data)
#Population for all US places
#nearly 30,000 observations
#Remove zero-population places
data<-data[data[,3]>0,]
dim(data)
#Remove NAs
data<-na.omit(data)
dim(data)
mean(data[,3])
#Keep pop>1000
data<-data[data[,3]>1000,]
dim(data)

#Now make a dataset with logs and new values  
#NOTE negative sign on rank (NY needs to be #1)
data2<-cbind(log(rank(-data[,3])),log(data[,3]))
head(data2)
colnames(data2)<-c("lnRank","lnSize")

#Make it a dataframe
is.data.frame(data2)
data2<-as.data.frame(data2)

#Look for NYC:
max(data[,3])
data[data[,3]==max(data[,3]),]

#Now find it in data2
data2[data[,3]==max(data[,3]),]
exp(data2[data[,3]==max(data[,3]),])[1]

#Take the exponent of a log
exp(data2[data[,3]==max(data[,3]),2])




#Regression for whole sample
reg1<-lm(lnRank~lnSize,data=data2)
summary(reg1)

#QUESTION: Is the intercept significantly different from log(NYC population)?
#Question: Is the slope significantly different from one?

#What about 100 largest cities?
data3<-data2[which(rank(data2$lnSize)<=100),]
dim(data3)
head(data3)
reg2<-lm(lnRank~lnSize,data=data3)
summary(reg2)

#Question: What does summary(reg2)[1] return? What about summary(reg2)[4] and summary(reg2)[8] ?




