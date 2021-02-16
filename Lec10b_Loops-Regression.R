#####################################################
#### ECON 346, NEIU
#### Running a regression AND using loops
#####################################################

data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/PlaceData2017.csv",header=TRUE)
head(data)
dim(data)
#Population for all US places
#nearly 30,000 observations
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

#Should be perfectly correlated
cor(data2,method="spearman")

#Sort by rank
data2<-data2[order(data2$lnRank),]
head(data2)

###################
##Create a loop to increase sample size
##Min = 25, max depends on time/computing power
############

#Make NULL table and attach rows one by one

max=nrow(data2)

regtable<-NULL
size<-NULL
for(i in 25:max){
  data4<-data2[which(rank(data2$lnSize)<=i),]
  reg<-lm(lnRank~lnSize,data=data4)
  size<-rbind(size,i)
  regtable<-rbind(regtable,reg$coefficients)
  print(100*i/max)
}
regtable<-cbind(size,regtable)
rownames(regtable)<-rep("",nrow(regtable))
tail(regtable)
plot(regtable[,c(1,3)],type="l",lwd=2,xlab="Sample Size",ylab="Beta(lnSize)")
