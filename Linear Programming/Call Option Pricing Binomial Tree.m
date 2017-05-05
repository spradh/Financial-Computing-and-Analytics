#Question 1
%Initializing variables
T=1/12                      % Expiration in years
N=100                       % Number of steps
delta_t=T/N                 % Time step
r=.02                       % Risk free rate
sigma=sqrt(.15)             % Volatility
S0= 144                     % Current Stock Price
K=150                       % Strike price
u=e.^(sigma*sqrt(delta_t))  % Uptick Increment
d=e.^(-sigma*sqrt(delta_t)) % Downtick Decrement
p=(e.^(r*delta_t)-d)/(u-d)  % Probability of Uptick
S=[];                       % Maturity stock price vector
f=zeros(N+1);               % Option value grid


%Initializing stock price at maturity
for j=1:N+1,
  S(j)=S0*u^(j-1)*d^(N+1-j);
end,


%Initializing option value at maturity

for j=1:N+1,
  f(j,N+1)=max(S(j)-K,0);
end,

%step back through the tree
for i=N:-1:1,
  for j=i:-1:1,
    f(j,i)=e.^(-r*delta_t)*(p*f(j,i+1)+(1-p)*f(j+1,i+1));
  end,
end,


fprintf("\n\nValue of option at current date is $%f.\n\n", f(1,1))
