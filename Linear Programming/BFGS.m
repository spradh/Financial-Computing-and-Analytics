#Quasi-Newton method using the BFGS upate for finding minimum values of multidimensional functions

#Question a
fprintf('Question a')
fprintf('\n==========')
function f=y(x),    % function
  f=-4*x(1)/(x(1).^2+x(2).^2+1);
endfunction

function df=dy(x),  % gradient function
  df=[(4*(x(1).^2-x(2).^2-1)./(x(1).^2+x(2).^2+1).^2); ((8*x(1)*x(2))./(x(1).^2+x(2).^2+1).^2) ];
endfunction

##################################
fprintf('\nFinding Minimum using BFGS')
fprintf('\n==========================')

B=eye(2);       % Hessian estimate
epsilon=0.001;  % tolerance
itr=0;          % k=0,1,...
x=[5; 4];       % initial guess x_0
prev=x;

while (sum(dy(x).^2)>epsilon && itr<10000),
  pk=-inv(B)*dy(x);
  alpha=.01;
  while (y(x+alpha*pk)<y(x)), % optimizing alpha
    alpha=alpha+0.001;
    x=x+alpha*pk;
  end,
  sk=x-prev ;       % step
  yk=dy(x)-dy(prev);% gradient difference
  if (yk'*sk>0),    % cheking if B_(k+1) is symmetric, positive, definite
    B=B-(B*sk*sk'*B)/(sk'*B*sk)+(yk*yk')/(yk'*sk);
                    % Updating Hessian Estimate
  else,
    fprintf('\nHessian estimate is not symmetric, positive, definite.Getting last correctly computed value for x.')
  end,
  prev=x;
  itr=itr+1;
end,

fprintf('\nMinimum is at:\n')
x

##################################
fprintf('\nFinding Maximum using BFGS')
fprintf('\n==========================')

B=eye(2);       % Hessian estimate
epsilon=0.001;  % tolerance
itr=0;          % k=0,1,...
x=[-2; 0];       % initial guess x_0
prev=x;

while (sum(dy(x).^2)>epsilon && itr<1000),
  pk=inv(B)*dy(x); % removing negative sign because we want to move in opposite direction 
  alpha=.01;
  while (y(x+alpha*pk)>y(x)), % optimizing alpha that maximizes the function
    alpha=alpha+.001;
    x=x+alpha*pk;
  end,
  sk=x-prev ;       % step
  yk=dy(x)-dy(prev);% gradient difference
  if (yk'*sk>0),    % cheking if B_(k+1) is symmetric, positive, definite
    B=B-(B*sk)*(B*sk)'/(sk'*B*sk)+(yk*yk')/(yk'*sk);
                    % Updating Hessian Estimate
  else,
    fprintf('\nHessian estimate is not symmetric, positive, definite.Getting last correctly computed value for x.')  
  end,
  prev=x;
  itr=itr+1;
end,

fprintf('\nMaximum is at:\n')
x

fprintf('==========')
#Question b
fprintf('\nQuestion b')
fprintf('\n==========')

function f=y(x),    % function
  f=sin(x(1).^2+x(2).^2);
endfunction

function df=dy(x),  % gradient function
  df=[2*x(1)*cos(x(1).^2+x(2).^2); 2*x(2)*cos(x(1).^2+x(2).^2) ];
endfunction

fprintf('\nFinding Minimum using BFGS')
fprintf('\n==========================')

B=eye(2);       % Hessian estimate
epsilon=0.001;  % tolerance
itr=0;          % k=0,1,...
x=[0; 1];       % initial guess x_0
prev=x;

while (sum(dy(x).^2)>epsilon && itr<10000),
  pk=-inv(B)*dy(x);
  alpha=.01;
  while (y(x+alpha*pk)<y(x)), % optimizing alpha
    alpha=alpha+0.001;
    x=x+alpha*pk;
  end,
  sk=x-prev ;       % step
  yk=dy(x)-dy(prev);% gradient difference
  if (yk'*sk>0),    % cheking if B_(k+1) is symmetric, positive, definite
    B=B-(B*sk*sk'*B)/(sk'*B*sk)+(yk*yk')/(yk'*sk);
                    % Updating Hessian Estimate
  else,
    fprintf('\nHessian estimate is not symmetric, positive, definite.Getting last correctly computed value for x.')
  end,
  prev=x;
  itr=itr+1;
end,

fprintf('\nMinimum is at:\n')
x

##################################
fprintf('\nFinding Maximum using BFGS')
fprintf('\n==========================')

B=eye(2);       % Hessian estimate
epsilon=0.001;  % tolerance
itr=0;          % k=0,1,...
x=[-2; 0];       % initial guess x_0
prev=x;

while (sum(dy(x).^2)>epsilon && itr<1000),
  pk=inv(B)*dy(x); % removing negative sign because we want to move in opposite direction 
  alpha=.01;
  while (y(x+alpha*pk)>y(x)), % optimizing alpha that maximizes the function
    alpha=alpha+.001;
    x=x+alpha*pk;
  end,
  sk=x-prev ;       % step
  yk=dy(x)-dy(prev);% gradient difference
  if (yk'*sk>0),    % cheking if B_(k+1) is symmetric, positive, definite
    B=B-(B*sk)*(B*sk)'/(sk'*B*sk)+(yk*yk')/(yk'*sk);
                    % Updating Hessian Estimate
  else,
    fprintf('\nHessian estimate is not symmetric, positive, definite. Getting last correctly computed value for x.')
  end,
  prev=x;
  itr=itr+1;
end,

fprintf('\nMaximum is at:\n')
x

