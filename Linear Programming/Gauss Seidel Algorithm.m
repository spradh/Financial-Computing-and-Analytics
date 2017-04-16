%Gauss Seidel Algorithm
A=[2 -1 0 0;-1 2 -1 0;0 -1 2 -1;0 0 -1 2];
n=size(A);
u_k=zeros(n,1);
b=[19;19;-3;-12];


D=zeros(n);
E=zeros(n);
F=zeros(n);
for i=1:n,
  for j=1:n,
    if i==j,
      D(i,j)=A(i,j);
    elseif i>j,
      E(i,j)=-A(i,j);
    else,
      F(i,j)=-A(i,j);
      endif,
  end
end

#sanity check
fprintf('A==(D-(E+F))\n')
isequal(A,(D-(E+F)))


k_max=10; %k=1000 gives correct answers
itr=0;


while(itr<k_max)
  for i=1:n,
    u_k(i,1)=(inv(D-E)*(F*u_k+b))(i,1);
  end
  itr=itr+1;
endwhile
fprintf('After 10 iterations \n')
u_k
