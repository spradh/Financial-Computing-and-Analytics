#Accept-reject
par(mfrow=c(2,2))

Nsim=5000
g=function(x){dgamma(x,shape=4,rate=4/4.85)} #candidate density
f=function(x){dgamma(x,shape=4.85,rate=1)} #target density

optimize(function(x){f(x)/g(x)},interval=c(0,20),maximum=TRUE)$objective
M=1.105143

u=runif(Nsim)*M
u
y=rgamma(Nsim,shape=4,rate=4/4.85)
f(y)/g(y)
x=y[u<f(y)/g(y)]

hist(x,breaks=40,probability = TRUE,main='Accept-Reject')
lines(seq(0,20,length.out=1000),f(seq(0,20,length.out=1000)),col=2,lwd=2)
