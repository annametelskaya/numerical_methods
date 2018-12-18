clc;
clear;
e=1/2*10^(-3);
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

Ls=0;
z=rand(n,1);
z=z/norm(z);
y=A*z;
Ln=dot(y,z)/dot(z,z);
while (abs(Ls-Ln)>e)
    Ls=Ln;
    z=y;
    z=z/norm(z);
    y=A*z;
    Ln=dot(y,z)/dot(z,z);
end
lambda1=Ln
x1=z


[V,D]=eigs(A,10);
max(max(D))
V

%сравнить lambda1 и max(max(D)), x1 и первый столбец V