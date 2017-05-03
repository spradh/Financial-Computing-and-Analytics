#Question 1
T=1/12;               % Expiration in years
N=12;                  % Number of steps
delta_t=T/N           % Time step
r=.02;                % Risk free rate
sigma=sqrt(.15);      % Volatility
S0= 144;              % Current Stock Price
K=150;                % Strike price
u=e.^(sigma*sqrt(T))  % Uptick Increment
d=e.^(-sigma*sqrt(T)) % Downtick Decrement
p=(e.^(r*T)-d)/(u-d)  % Probability of Uptick
S=[];                 % Maturity stock price vector
f=zeros(N+1);         % Option value grid


%Initializing stock price at maturity
for j=1:N+1,
  S(j)=S0*u^(j-1)*d^(N+1-j);
end,
printf("Stock Prices at Maturity: \n")
S

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
printf("Option Value Grid : \n")
f
current_price_of_option=f(1,1);
fprintf("Value of option at current date is $%f.\n\n", current_price_of_option)
