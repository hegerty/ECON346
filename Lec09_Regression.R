############################################################
# ECON 346 NEIU
# Regression Example: lm() function and matrix ("by hand")
############################################################

#Generate 1000 observations of random data
data1<-rnorm(1000,mean=100,sd=5)
head(data1)

#Generate 1000 observations based on Y = 250 + 10X + e
data2<-250+10*data1+rnorm(1000,mean=0,sd=50)
plot(data1,data2,ylim=c(0,1600))

#Make dataframe, plot; add regression line
dataset<-as.data.frame(cbind(data1,data2))
colnames(dataset)<-c("X","Y")
plot(dataset,pch=20,cex=.4,col="orange")
abline(lm(dataset$Y~dataset$X),lty=3,col="brown",lwd=.8)

#Now calculate a bivariate regression
reg1<-lm(dataset$Y~dataset$X)
summary(reg1)

#Do the regression "by hand" as a matrix: Beta = [(X'X)-1](X'Y)
regdata<-cbind(rep(1,nrow(dataset)),dataset)
is.matrix(regdata)
regdata<-as.matrix(regdata)
X<-regdata[,1:2]
colnames(X)[1]<-"Constant"
Y<-regdata[,3]
betas<-solve(t(X)%*%X)%*%t(X)%*%Y
betas

#Calculate predicted value: X*beta
yhat<-X%*%betas

#And the residuals
resid<-Y-yhat


#Get Residual Sum of Squares (RSS) and Explained Sum of Squares (ESS); the sum is Total (TSS)
###  This gives you R2
#Also get SE of the Regression: e'e/(N-k)
RSS<-t(resid)%*%resid
S2<-RSS/(length(Y)-ncol(X))
ESS<-sum((yhat-mean(Y))^2)
R2<-ESS/(RSS+ESS)

#Make a Variance-Covariance Matrix
vcovmatrix<-sqrt(solve(t(X)%*%X)*as.numeric(S2))
vcovmatrix

#Use to make SE and T-stat; combine into a nice table
se<-diag(vcovmatrix)
tstat<-betas/se
table<-round(cbind(betas,se,tstat),3)
table<-rbind(table,c(round(R2,3),"",""))
colnames(table)<-c("Beta","SE","T")
rownames(table)[3]<-"R2"
noquote(table)


##In case you want to see Ybar
#abline(h=mean(Y),col="red",lty=5,lwd=0.6)


####
#Regression with one more variable
#Make one more variable that is unrelated
Z<-rnorm(1000,mean=20,sd=15)
dataset<-cbind(dataset,Z)

#Add to regression
reg2<-lm(Y~X+Z,data=dataset)
summary(reg2)

##Is Z significant? What happens to R2?
