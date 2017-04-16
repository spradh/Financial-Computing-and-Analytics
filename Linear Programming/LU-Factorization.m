#LU-Factorization algorithm
A=[1 2 3; 2 1 -2;1 0 4]
M=A;
n=length(M);
L=eye(n);
for i=1:n,
  for j=i+1:n,
    L(j,i)=M(j,i)/M(i,i);
    for k=i+1:n,
      M(j,k)=M(j,k)-M(j,i)/M(i,i)*M(i,k);
      
    end,
  end,
end,

for i=1:n,
  for j=1:n,
    if j<i,
      M(i,j)=0;
    end,
  end,
end,
L
M
disp('L * M')
L*M
