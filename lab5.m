clear;
clc;

n=10;
A=zeros(n);
S=eye(n);
v=10;
a = zeros(n,1);
b = zeros(n-1,1);
c = zeros(n-2,1);
for i=1:n
    a(i) = v + 10/(10+i);
    if (i<n)
        b(i) = v + 10/i;
    end
    if (i<n-1)
        c(i) = v + (1+i)/10;
    end
end
A=diag(a,0) + diag(b,-1) + diag(b,1) + diag(c,-2) + diag(c,2);
oldA=A;
[V,D]=eigs(A,10)

for i=n-1:-1:1
    invM=eye(n);
    invM(i,:)=A(i+1,:);
    M=inv(invM);
    A=invM*A*M;
    S=S*M;
end
A;

syms p x
p=x^(n);
for i=1:n
    p=p-A(1,i)*x^(n-i);
end
L=solve(p,x);

X = zeros(n);
for i=1:length(L)
    l=L(i);
    y=[l^(n-1);l^(n-2);l^(n-3);l^(n-4);l^(n-5);l^(n-6);l^(n-7);l^(n-8);l^(n-9);1]; 
    X(:,i)= S*y;
end
X


norm(eval(oldA*X(:,1)-L(1)*X(:,1)))