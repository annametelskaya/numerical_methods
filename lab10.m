clc;
clear;
eps=10^(-11);
f_1 = @(x,y) x+3*sin(x)-y.^2;
f_2 = @(x,y) 2*x.^2-x*y-5*x+1;
t = -2:0.05:2;
[X,Y]=ndgrid(t,t);
F1=f_1(X,Y);
F2=f_2(X,Y);
contour(X,Y,F1,[0 0])
hold on
contour(X,Y,F2, [0 0])
hold on
J = @(x,y) [1+3*cos(x),-2*y;4*x-y-5,-x];
F = @(x,y) [f_1(x,y); f_2(x,y)];
x=[0;0.27];
err(1)=1;
k=1;
while err(k)>eps 
    x=x-inv(J(x(1),x(2)))*(F(x(1),x(2)));
    k=k+1;
    err(k)=norm(F(x(1),x(2)));
end
plot(x(1),x(2),'.','MarkerSize',25)
f_1(x(1),x(2))
f_2(x(1),x(2))
figure
semilogy(err) 

mesh(X,Y,F1)
hold on
mesh(X,Y,F2)
