clc;
clear;
eps=10^(-11);
f=@(x) x.^5-32;
tau=-1/46;
fi=@(x) x+tau*f(x);
X=1:0.1:4;
plot(X,X,X,fi(X))
x(1)=1;
k=1;
Error(k)=1;
while Error(k)>eps
k=k+1;
x(k)=fi(x(k-1));
Error(k)=abs(f(x(k)));
end
Error
k
sprintf('ответ x=%0.4f',x(k-1))
semilogy(1:k, Error)



//|1+тау*f'(x)|<1
//-2<тау*(5*х^4)<0
//Х=2
