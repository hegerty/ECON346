#######################################
## ECON 346 F23
## dnorm gives the density at a point
#######################################
df=2 # for the t-distribution
d1<-seq(-10,10,.1) # set a range of points
d2<-rep(0,length(d1)) # these start with all zeros and get filled in
d3<-rep(0,length(d1))
for(i in 1:length(d2)){
  d2[i]<-dnorm(d1[i]) # normal
  d3[i]<-dt(d1[i],df) # t
  } # Calculate at each point
d2
# Plot normal and t-distribution density curves
plot(seq(-10,10,.1),d2,type="l",xlim=c(-4,4),ylim=c(0,.5),xlab="",ylab="prob")
par(new=TRUE)
plot(seq(-10,10,.1),d3,type="l",xlim=c(-4,4),ylim=c(0,.5),xlab="",ylab="prob",col="#FF0000")
legend("topright",legend = c("Normal",paste("t(",df,")",sep="")),lty=c(1,1),col=c("black","#FF0000"),bty="n")

# Try with df = 12, 120

