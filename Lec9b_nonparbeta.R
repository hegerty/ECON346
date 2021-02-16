###############################################
## ECON 346, NEIU
## Very simple nonparametric Regression vs. OLS
## b = Median of (yi-yj)/(xi-Xj) 
##    for all pairs where the denominator != 0
## a = median (y-bx)
## Also calculate ESS and R-Sq
## Compare Nonparametric vs. OLS
###############################################

#Generate n random x's, with y's as a function of x plus random error
set.seed(19)
n=250
x=rnorm(n,20,2)
y=5*x+rnorm(n,0,5)

#plot with OLS regression line; run OLS
plot(x,y,pch=20)
abline(lm(y~x))
reg1<-lm(y~x)
b1<-summary(reg1)
b1

#Loop to calculate all (xj-xi) and (yj-yi) pairs
results<-NULL
pairs<-NULL
for(j in 1:n){
  x1<-x[j]
  y1<-y[j]
  for(i in 1:n){
    xpair<-x1-x[i]
    ypair<-y1-y[i]
    pairs0<-cbind(xpair,ypair)
    pairs<-rbind(pairs,pairs0)
  }
}
length(pairs)
head(pairs)

#eliminate zeros for xj-xi
pairs<-pairs[pairs[,1]!=0,]
length(pairs)

#Calculate slope coefficient
betalist<-pairs[,2]/pairs[,1]
npbeta<-median(betalist)
parbeta<-b1$coefficients[2]

#calculate intercept
npalpha<-median(y-npbeta*x)
paralpha<-b1$coefficients[1]

#plot points with both lines
plot(x,y,pch=20)
abline(lm(y~x))
abline(a=npalpha,b=npbeta,lty=2)
b1

#calculate R2
yhat<-npalpha+npbeta*x
e<-y-yhat
ESS<-sum(e^2)
RSS<-sum((yhat-mean(y))^2)
TSS<-ESS+RSS
R2<-RSS/TSS

#Make comparison table:
#Include R-Sq. and ESS
results<-rbind(c(npalpha,paralpha),c(npbeta,parbeta),c(R2,b1$r.squared),c(ESS,sum(b1$residuals^2)))
rownames(results)<-c("alpha","beta","R-Sq.","ESS")
colnames(results)<-c("NP","OLS")
round(results,3)

#"mblm" package, without repeated medians
# library(mblm)
# np2<-mblm(y~x,repeated = FALSE)
# summary(np2)

