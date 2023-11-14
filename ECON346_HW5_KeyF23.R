###################################################################
## ECON 346 HW5 Key F23
###################################################################

data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/PlaceData2017.csv",header=TRUE)
head(data)
dim(data)

# Q1- subset the data
data<-data[data[,3]>200000,]
dim(data)
head(data)
# One way to get the largest city
head(data[order(data[,3],decreasing = TRUE),],)

# Q2
#Now make a dataset with logs and new values  
#NOTE negative sign on rank (NY would be be #1, but it's cut!)
# You can sort the whole matrix, but you don't have to:
# data2[order(data2[,1]),]


data2<-cbind(log(rank(-data[,3])),log(data[,3]))
colnames(data2)<-c("lnRank","lnSize")
data2<-as.data.frame(data2)
head(data2)
tail(data2)

# You can also find minimum rank here:
data[which.min(data2[,1]),2]

# Q3
# Check the summary too
reg1<-lm(lnRank~lnSize, data=data2)
summary(reg1)

#Q4
#Note this step to get the results table
regdata<-summary(reg1)[4]
regdata
#Q5 Test hypothesis: USE s.e. and make sure to subtract 1
#select rows, columns
(regdata$coefficients[2,1]-(-1))/regdata$coefficients[2,2]
#Greater than 2?

## I stole this from a student but changed the code a bit
attach(data2)
plot(lnSize,lnRank, pch=20,xlab="lnSize",ylab="lnRank",main="Rank-Size Rule",ylim = c(0,max(data2$lnRank)))
abline(lm(lnRank~lnSize),lwd=3,lty=2,col="grey")


