###################################################
## ECON 346 Binomial Distribution example 
## Becomes Normal with large numbers
##################################################

## Overview: permutations, combinations, binomial distribution
## "Hard way": P = n!/(n-k)! C = n!/k!(n-k)!

# Or: Download a package (I like the old way myself)
# install.packages("combinat")
library(combinat)


####################################################
## Here: look at tossing coins, # Heads = # successes
#Make a coin!
coin<-c("H","T")

#Show the four outcomes from 2 coin tosses
expand.grid(coin,coin)

#Show the four outcomes from 4 coin tosses
toss4<-expand.grid(coin,coin,coin,coin)
toss4

# Can simplify to any n using rep and list
n=4
tossn<-expand.grid(rep(list(coin),n))
tossn

#Make a logical matrix
toss4b<-toss4=="H"
toss4b

#rowsums = How many heads? TRUE = 1, FALSE = 0
rowSums(toss4b)


# Get proportion by dividing # heads by length of vector
k = 2 #set k in this case
l4<-length(which(rowSums(toss4b)==k))
l4
l4/nrow(toss4)
#Change k and repeat--> Here, all in one step

table(rowSums(toss4b))/nrow(toss4b) # summary table

#Gives all possibilities! No need to count them

# Try some permutations (count vs. formula)
# Make a list of all possibilities
# Also note: list and unlist

# length is the number of permutations
# 4 things 4 at a time
perm1<-permn(x=4)
perm1
class(perm1)

# This is a list; will just extract length
perm<-length(perm1)
perm # 24 outcomes

#Compare to factorials
factorial(4)
4*3*2*1

# 4 things, 2 at a time
factorial(4)/factorial(2)

###################
#Try a Combination: 4 things, 1 at a time
comb1<-combn(4,1)
comb1
class(comb1)
comb<-length(comb1)
comb

#Compare to factorials
factorial(4)/(factorial(3)*factorial(1))

# 4 things, 2 at a time
comb1<-combn(4,2)
comb1
comb<-ncol(comb1)
comb

#Compare to factorials
factorial(4)/(factorial(2)*factorial(2))


## Extra example: Arrange numbers 1-6 in 720 ways
list6<-1:6
permn(list6) # This needs to be cleaned up

perm6<-unlist(permn(list6))
dim(perm6)<-c(length(list6),length(perm6)/length(list6))
perm6<-t(perm6)
head(perm6)
tail(perm6)

## Same as factorial 6
factorial(6)
6*5*4*3*2*1

## What about combinations of 6, 2 at a time?
factorial(6)/(factorial(4)*factorial(2))
t(combn(6,2))
ncol(combn(6,2))

###############################
## Back to coin toss
# Formula for binomial test
# k successes in n trials
# Fill in parameters for p, q = (1-p), k, n

#One success : Would be HTTT, THTT, TTHT, TTTH in 16 trials (4/16 = 1/4)
p=0.5
q=1-p
n=4
k=1

(factorial(n)/(factorial(k)*(factorial(n-k))))*((p^k)*(q^(n-k)))

# Test whether p really is 0.5 if 1 Heads in 4 Tosses
# Does it match?
# Is p significantly less than from 0.5 (reject the Null?)
binom.test(1,4,alternative = "less") # Use R function

## Try zero successes
#Formula w/combination = 1
p=0.5
q=1-p
n=4
k=0

(factorial(n)/(factorial(k)*(factorial(n-k))))*((p^k)*(q^(n-k)))

#Test whether p really is 0.5 if 4 Heads in 4 Tosses
# Is p significantly greater than from 0.5 (reject the Null?)
binom.test(4,4,alternative = "greater") # same as zero heads

#####################################
## Make table with pdf and cdf for binomial coin toss, n = 100
## I graph this in class and the notes

n = 100
table<-NULL
for(k in 0:n){
  prob<-(factorial(n)/(factorial(k)*factorial(n-k)))*(p^k)*(q^(n-k))
  table<-rbind(table,cbind(k,prob))
}
table<-cbind(table,cumsum(table[,2]))
colnames(table)[3]<-"c_prob"
table

# plot pdf
plot(table[,c(1,2)],pch=20)

# plot cdf
plot(table[,c(1,3)],pch=20)

# calculate mean and sd
mean<-n*p
sd<-sqrt(n*p*q)

## re-plot pdf with 2sd lines
plot(table[,c(1,2)],type="l",xlab = "# Heads",ylab="Prob")
abline(v=mean-c(-2,2)*sd,lty=2,col="dark grey")

# zoom in to middle
plot(table[,c(1,2)],type="l",xlab = "# Heads",ylab="Prob",xlim=c(35,65))
abline(v=mean-c(-2,2)*sd,lty=2,col="dark grey")



