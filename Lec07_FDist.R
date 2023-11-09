#################################
## NEIU ECON 346
## F distribution example
#################################
k=15
for(j in 1:k){
  for(i in 1:k){
    f1<-rf(1000000,j,i)
    hist(f1,1000,probability = TRUE,xlim=c(0,30),ylim=c(0,0.8),xlab="F-Distribution",main=paste("d.f. = ",j,", ",i,sep=""),col="green",lty=0)
    abline(v=qf(.95,j,i),lwd=3,col="#006600")
    legend("right",legend=paste0("95% C.V. = ",round(qf(.95,j,i),2)),col="#006600",lty=1,lwd=3,bty="n")
  }
}
# Try a larger k if you have time: k = 25
