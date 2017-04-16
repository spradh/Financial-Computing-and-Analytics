%Jacobi Algorithm
fprintf('Jacobi Algorithm\n')
fprintf('================\n')
A=[2 -1 0 0;-1 2 -1 0;0 -1 2 -1;0 0 -1 2];
n=size(A);
u_k=zeros(n,1);
b=[19;19;-3;-12];


M=zeros(n);
N=zeros(n);
for i=1:n,
  for j=1:n,
    if i==j,
      M(i,j)=A(i,j);
    else,
      N(i,j)=-A(i,j);
      endif,
  end
end
#sanity check
fprintf('A==(M-N)\n')
isequal(A,M-N)


k_max=10; %k=1000 gives correct answers
itr=0;


while(itr<k_max)
  u_new=(N*u_k+b)./sum(M,2);
  u_k=u_new;
  itr=itr+1;
endwhile
fprintf('After 10 iterations \n')
u_k
