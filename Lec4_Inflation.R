########################################
# ECON346 Lab/Assignment 4: Inflation
##########################################

#Take inflation rate for four countries: Canada, Japan, UK, US
#Calculate correlations
#Fix certain errors
#also introducing data types

#Load data from my website: Source: IFS
data<-read.csv("https://raw.githubusercontent.com/hegerty/ECON346/main/Lab2levelsData.csv",header=TRUE)
head(data)
#Just need prices; delete columns 2-5 (keep year)
#Note the notation for 1) Selecting columns and 2) dropping this selection
data<-data[,-c(2:5)]
head(data)
tail(data)
inf<-100*diff(log(data))
#Error message appears

#One way: Fix it column-by-column
#callculate and bind columns
CN<-100*diff(log(data[,2]))
JP<-100*diff(log(data[,3]))
UK<-100*diff(log(data[,4]))
US<-100*diff(log(data[,5]))

inf<-cbind(data[-1,1],CN,JP,UK,US)
head(inf)

#Second method: look for the error and fix
#try is.numeric()
#data can be in "character", "logical", "factor","list", etc.

is.numeric(data[,1])
is.numeric(data[,2])
is.numeric(data[,3])
is.numeric(data[,4])
is.numeric(data[,5])

#try another
is.logical(data[,2])

#data can also be data frames, matrices, etc.
is.vector(data[,2])
is.matrix(data)
is.data.frame(data)

#Alternative method: Convert data frame to matrix so diff() works
data2<-as.matrix(data)
is.matrix(data2)
inf2<-100*diff(log(data2[,2:5]))

#they look the same (we didn't add a year column, though)
head(inf)
head(inf2)

#But original data look different
head(data)
head(data2)

#Are they equal?
#Difference should be zeros
inf-inf2
inf[,2:5]-inf2

#Now calculate correlations
cor(inf)
#Drop year column; create object "cors"
cor(inf[,-1])
cors<-round(cor(inf[,-1]),3)
cors
#Try a nonparametric correlation: Spearman (vs. Pearson)
cors2<-round(cor(inf[,-1],method = "spearman"),3)
cors2

#QUESTION: Calculate a third type of correlation, "Kendall's tau," using "kendall" where needed.
#CHALLENGE QUESTION: Replace one observation with a huge number and see what happens. In this case, change Japan's 1992 inflation rate to 2000 and recalculate.


#*******************************
#TIP: try lower.tri() for a nicer matrix
lower.tri(cors)
cors[lower.tri(cors)==TRUE]<-""
cors
noquote(cors)

#Try a time series plot to see inflation dynamics
plot(inf[,1],inf[,2],type="l",xlab="",ylab="CNINF")
