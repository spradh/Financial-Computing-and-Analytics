#Exercise 3.3
par(mfrow=c(2,1))
h=function(u){exp(-1/(2*u^2))/(u^2)}

curve(h,xlim=c(0,1/20))

N=10^5
x=h(1/20*runif(N))*1/(20*sqrt(2*pi))

estint=(cumsum(x)/1:N)
estint[N]
esterr=sqrt(cumsum((x-estint)^2))/1:N
esterr[N]
plot(1:N,estint,ylab='', ty='l',ylim=mean(x)+20*c(-esterr[N],esterr[N]))
lines(1:N,estint+2*esterr,ty='l',col='gold')
lines(1:N,estint-2*esterr,ty='l',col='gold')
lines(estInt)

sigma=sd(x) #Sigma
sigma
mu=mean(x)
mu
k=max(abs(x-mu))/sigma
k

#P(|Y-Mean|< k*sigma)=>1-1/k^2
1-1/k^2

##############################################
##############################################

#Exercise 3.4

#b

h=function(x){exp(-((x-3)^2)/2)+exp(-((x-6)^2/2))}

curve(h,from=-1,to=10,xlab='x',ylab='h')

N=10^3
x=h(rnorm(N))

estInt=cumsum(x)/(1:N)
estInt[N]
estErr=sqrt((x-estInt)^2)/(1:N)

plot(estInt,xlab='Iterations',ty='l',ylab='',ylim=mean(x)+20*c(-esterr[N],esterr[N]))
lines(estInt+2*estErr,col='gold')
lines(estInt-2*estErr,col='gold')
lines(estInt)
estErr[N]

sigma=sd(x) #Sigma
sigma
mu=mean(x)
mu
k=max(abs(x-mu))/sigma
k

#P(|X-Mu|<k* sigma)=>1-1/k^2
1-1/k^2


################################3
#c

h=function(x){exp(-((x-3)^2)/2)+exp(-((x-6)^2/2))}
f=function(x){exp(-x^2/2)/sqrt(2*pi)}
N=10^3
x=runif(N,-8,-1)
g=1/7
x=f(x)*h(x)/(g)


estInt=cumsum(x)/(1:N)
estInt[N]
estErr=sqrt((I-estInt)^2)/(1:N)

plot(estInt,xlab='Iterations',ty='l',ylab='',ylim=mean(x)+40*c(-esterr[N],esterr[N]))
lines(estInt+2*estErr,col='gold')
lines(estInt-2*estErr,col='gold')
lines(estInt)
estErr[N]


sigma=sd(x) #Sigma
sigma
mu=mean(x)
mu
k=max(abs(x-mu))/sigma
k

#P(|X-Mu|<k* sigma)=>1-1/k^2
1-1/k^2

