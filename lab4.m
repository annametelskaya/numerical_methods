clear;
clc;

n=7;
N=n^2;
eps=1.e-5;
A=gallery('poisson', n)
%ћетод якоби
B=spdiags(diag(A),0,N,N);
D=(inv(B))*A;
f =rand(N,1);
g=(inv(B))*f;
x = zeros(N,1);
r=D*x-g;
err=norm(r)/norm(g);
k=0;
while (err>eps & k<1000)
    tau=(r' * r)/((A*r)'*r);
    x=x-tau*r;
    r=D*x-g;
    err=norm(r)/norm(g);
    k=k+1;
    Err(k)=err;
end
%ћетод «ейдел€
C=triu(A);
D=(inv(C))*A;
f =rand(N,1);
g=(inv(C))*f;
x = zeros(N,1);
r=D*x-g;
err=norm(r)/norm(g);
k2=0;
while (err>eps & k2<1000)
    tau=(r' * r)/((A*r)'*r);
    x=x-tau*r;
    r=D*x-g;
    err=norm(r)/norm(g);
    k2=k2+1;
    Err2(k2)=err;
end
%ѕопеременно треугольный метод
R1=triu(A);
R2=tril(A);
O=eye(N);
E=(O+0.5*R1)*(O+0.5*R2);
D=(inv(E))*A;
f =rand(N,1);
g=(inv(E))*f;
x = zeros(N,1);
r=D*x-g;
err=norm(r)/norm(g);
k3=0;
while (err>eps & k3<1000)
    tau=(r' * r)/((A*r)'*r);
    x=x-tau*r;
    r=D*x-g;
    err=norm(r)/norm(g);
    k3=k3+1;
    Err3(k3)=err;
end
semilogy(1:k, Err, 1:k2,Err2,1:k3,Err3)
legend('якоби','«ейдел€','треугольный');