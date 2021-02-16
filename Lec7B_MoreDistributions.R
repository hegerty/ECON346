###############################################################
# ECON 346 Extra example:
# Visualizing the Chi-Squared distribution
###############################################################

#Change the degrees of freedom--> approaches Normal as d.f. increase
#Some commands for pasting, color, etc.

####
#First just plot one (with 1 d.f.)
#One million random numbers that fit
#Can plot the density 
chi1<-rchisq(1000000,1)
plot(density(chi1),main="Chi-Sq.(1)",xlim=c(0,10))



#####################################################################
#Generate some Chi-Sqared distributions using a loop
#sum of N squared normals with N degrees of freedom
#Note: Mean = N, Var = 2N
#Plot 10 with various degrees of freedom
#Use histograms instead of a line graph
#Use a loop for calculating, 
#Change some lines, color, etc.

set.seed(0)
l1=c(1,2,3,4,5,10,25,100,500,1000)
par(mfrow=c(5,2))
par(mar=rep(2,4))
StatsTable<-NULL
for(i in l1){
  chi1<-rchisq(1000000,i)
  hist(chi1,1000,probability = TRUE,main=paste("d.f.= ",i,sep=""),col="green",lty=0)
StatsTable<-rbind(StatsTable,c(mean(chi1),sd(chi1),var(chi1),var(chi1)/mean(chi1)))
}
StatsTable<-as.data.frame(StatsTable)
colnames(StatsTable)<-c("Mean","SD","Var","Var/Mean")
rownames(StatsTable)<-l1
round(StatsTable,3)
par(mfrow=c(1,1))
