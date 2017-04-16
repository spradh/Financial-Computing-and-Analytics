#############################
#############################
#Exercise 6.2
x=c(rnorm(1))

for(t in 1:10^4){
  x[t+1]=x[t]+rnorm(1)
} 

hist(x,breaks=50,probability =TRUE)
lines(seq(-10,10,length.out=10000),dnorm(seq(-10,10,length.out=10000),
                                         0,1),ty='l')

x=c(rnorm(1))

for(t in 1:10^6){
  x[t+1]=x[t]+rnorm(1)
} 

hist(x,breaks=50,probability =TRUE)
lines(seq(-10,10,length.out=10000),dnorm(seq(-10,10,length.out=10000),
                                         0,1),ty='l')

#############################
#############################
#Exercise 6.4 

#c. Metropolis{Hastings algorithm to generate 5000 G(4.85, 1) random variables.
a=4; b=4/4.85
Nsim=5000
X=rep(rgamma(1,shape=a,rate=b),Nsim)
for (i in 2:Nsim){
  Y=rgamma(1,shape=a,rate=b)
  rho=dgamma(Y,shape=4.85,rate=1)/dgamma(X[i-1],shape=4.85,rate=1)
  X[i]=X[i-1]+(Y-X[i-1])*(runif(1)<rho)
}
hist(X, breaks=100,probability = TRUE,main='Metropolis-Hastings')
lines(seq(0,20,length.out=1000),f(seq(0,20,length.out=1000)),col=2,lwd=2)


#  d. Compare the algorithms using (i) their acceptance rates and (ii) the estimates
#  of the mean and variance of the G(4:85; 1) along with their errors. 
# (Hint:Examine the correlation in both samples.)
#Accept Reject
#(i)

length(x)/length(y)

#(ii)
mean(x)
var(x)

acf(x,main='Accept-Reject')#less coorelation


#Metropolis Hastings
#(i)
a=c()
for(i in 1:Nsim-1){
  a=c(a, X[i]!=X[i+1])
}
sum(a)/5000

#(ii)
mean(X)
var(X)

acf(X,main='Metropolis-Hastings')#more coorelation

par(mfrow=c(1,1))
plot(4700:Nsim,X[4700:Nsim],ty='l')

#############################
#############################
#Exercise 6.10

#a
Nsim=5000
X=rep(rnorm(1),Nsim)
for (i in 2:Nsim){
  Y=rnorm(1)
  rho=dt(Y,df=4)/dt(X[i-1],df=4)
  X[i]=X[i-1]+(Y-X[i-1])*(runif(1)<rho)
}
hist(X, breaks=100,probability = TRUE)
lines(seq(-3,3,length.out=1000),dt(seq(-3,3,length.out=1000),df=4),col=2,lwd=2)

#b
Nsim=5000
X=rep(rt(1,df=2),Nsim)
for (i in 2:Nsim){
  Y=rt(1,df=2)
  rho=dt(Y,df=4)/dt(X[i-1],df=4)
  X[i]=X[i-1]+(Y-X[i-1])*(runif(1)<rho)
}
hist(X, breaks=100,probability = TRUE)
lines(seq(-3,3,length.out=1000),dt(seq(-3,3,length.out=1000),df=4),col=2,lwd=2)

