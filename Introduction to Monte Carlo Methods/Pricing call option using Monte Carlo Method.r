#Question 2
T=1/12;               # Expiration in years
r=.02;                # Risk free rate
sigma=sqrt(.15);      # Volatility
S0= 144;              # Current Stock Price
K=150;                # Strike price


s=sigma*sqrt(T)             #log standard deviation
m=(log(S0)+(r-sigma^2/2)*T) #log mean

f=function(x){(1/(x*sqrt(2*pi*s^2)))*exp(-(log(x)-m)^2/(2*s^2))}
#f is log normal with mean m and standard dev. s

h=function(x){x-K}

plot(seq(0,300),dlnorm(seq(0,300),m,s),ty='l', ylab="Probability density",xlab="Stock price")

x=h(rlnorm(10^6,m,s))


x[x<0]=0
estint=cumsum(x)/1:10^6
esterr=sqrt(cumsum(x-estint)^2)/(1:10^6)

plot(estint,type='l',lwd=2,ylab="Estimated Price of Option",xlab="Iterations")
lines(estint+2*esterr,col='gold')
lines(estint-2*esterr,col='gold')

option_price=estint[10^6]
option_price

#Error estimates of the model using Chebyshev's theorem
k=max(abs(x-option_price))/sd(x)
k

#P(|X-Mu|<k* sigma)=>1-1/k^2
1-1/k^2

####
#Question3
T=1/12;               # Expiration in years
N=5;                  # Number of steps
delta_t=T/N           # Time step
r=.02;                # Risk free rate
sigma=sqrt(.15);      # Volatility
S0= 144;              # Current Stock Price
K=150;                # Strike price


par(mfrow=c(1,1))
f=function(x){(1/(x*sqrt(2*pi*s^2)))*exp(-(log(x)-m)^2/(2*s^2))}

plot(seq(0,300),dlnorm(seq(0,300),m,s),ty='l', ylab="density",xlab="Stock price")
lines(seq(0,300),dunif(seq(0,300),150,200),col='red')

x=runif(10^6,150,200)

y=x
x=x-K
x[x<0]=0

estint=cumsum(x*dlnorm(y,m,s)/dunif(y,150,200))/(1:10^6)

esterr=sqrt(cumsum(x*dlnorm(y,m,s)/dunif(y,150,200)-estint)^2)/(1:10^6)

plot(estint,type='l',lwd=2,ylab="Estimated Price of Option",xlab="Iterations")
lines(estint+2*esterr,col='gold')
lines(estint-2*esterr,col='gold')

option_price=estint[10^6]
option_price

#Error estimates of the model using Chebyshev's theorem
k=max(abs(x-option_price))/sd(x)
k

#P(|X-Mu|<k* sigma)=>1-1/k^2
1-1/k^2

