############################################
## ECON 346
## Spearman correlation coefficient (Medium)
#############################################

# Generate 1,000 obsrvations: Uniform distribution
set.seed(41)
x<-runif(1000,10,20)
hist(x,breaks = 20) # just to see the distribution
y<-.5*x+rnorm(1000,0,3) # x + randomness
cor(x,y) # Pearson correlation
plot(x,y,pch=20)
reg<-lm(y~x) #regression
summary(reg)
abline(reg,lwd=4,col="#CCCCCC") #customize regression line

# Now calculate Spearman correlation
cor(x,y,method="spearman")

# enter the formula!
rankx<-rank(x)
rankx # show it
ranky<-rank(y)
d<-rankx-ranky # differences in ranks
d #show it
sumd2<-sum(d^2) #sum of squares
sumd2 # a single value
num =6*sumd2
n<-length(x) # get n
denom<-n*(n^2-1)
spearman.rho<-1-num/denom #formula
spearman.rho # calculated value

cor(x,y,method="spearman") #for comparison

