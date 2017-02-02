#Exercise 2.2

#Considering mu=0, sigma=1 and beta=1:
#a)
Nsim=10^4
U=runif(Nsim)
X=0-1*log(1/U-1)
Y=rlogis(Nsim)
par(mfrow=c(1,2))
hist(X, freq=F, main="Logistic from Uniform")
hist(Y,freq=F,main="Logistic from R")

#b)
Nsim=10^4
U=runif(Nsim)
X=tan(pi*(U-0.5))
Y=rcauchy(Nsim)
par(mfrow=c(1,2))
hist(X, freq=F, main="Cauchy from Uniform")
hist(Y,freq=F,main="Cauchy from R")

###########################################
###########################################
