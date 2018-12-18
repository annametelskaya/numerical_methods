clc;
clear;
eps=10^(-11);
f=@(x) x.^5-32;
fp=@(x) 5*x.^4;
fi=@(x) x-f(x)/fp(x);
X=1:0.1:4;
x(1)=1;
k=1;
Error(k)=1;
while Error(k)>eps
k=k+1;
x(k)=fi(x(k-1));
Error(k)=abs(f(x(k)));
end
sprintf('ответ x=%0.4f',x(k-1))
semilogy(1:k, Error)
