#################################
## NEIU ECON 346
## Poisson distribution example
#################################

# Recall that the distribution p(x = k) = (lambda^k)*exp(-lambda)/k!
# try some numbers and compare "medium" and "easy" way

lambda<-2 #  = expected value
k<-3 # number of occurrences, also sd

(lambda^k)*exp(-lambda)/factorial(k)
dpois(k,lambda)  # density
qpois(.95,lambda) # quantile
ppois(k,lambda) # probability

# Try with 6
lambda<-2 #  = expected value, also variance
k<-6 # number of occurences, 

# Equation first
(lambda^k)*exp(-lambda)/factorial(k)
dpois(k,lambda)  # density
qpois(.95,lambda) # quantile
ppois(k,lambda) # probability

# Now try lambda = [1,6] and k = [1,12]
# Do a double loop
table<-NULL
for(lambda in(1:6)){
  for(k in(1:12) ){
    tab1<-cbind(lambda,k,dpois(k,lambda))
    table<-rbind(table,tab1)
  }
 }
table  # all results together

#Choose colors to plot
#install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all() # just an example; we want six greys

colors<-brewer.pal(7,"Greys")[-1] # the lightest is too light

# now plot
for(i in unique(table[,1])){
p1<-table[table[,1]==i,]
plot(p1[,2:3],type = "l",lwd=3,ylim=c(min(table[,3]),max(table[,3])),col=colors[i],main = "Poisson Distribution")
par(new=TRUE)
}
legend("topright",legend=paste0("lambda = ",unique(table[,1])),text.col = colors,bty="n")


