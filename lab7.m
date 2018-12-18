 clc;
clear;
e=1*10^(-9);
err=1;
n=10;
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
while (err>e)
    for k=2:n
        [i,j]=find(abs(A(k,1:k-1))-max(abs(A(k,1:k-1)))==0); 
        t=(2*A(k,j))/(A(k,k)-A(j,j));
        s=sign(t)*sqrt((sqrt(1+(t^2))-1)/(2*(sqrt(1+(t^2))))); 
        c=sqrt((sqrt(1+(t^2))+1)/(2*(sqrt(1+(t^2))))); 
        T=eye(n);
        T(k,k)=c;
        T(j,j)=c;
        T(j,k)=s;
        T(k,j)=-s;
        A=T'*A*T;
        B=A.^2;
        err=sum(sum(B-diag(diag(B))));
    end
end
sort(diag(A),'ascend')
sort(eig(oldA),'ascend')
