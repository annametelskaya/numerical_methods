clear;
clc;

a=1;
b=2;

Norm1=zeros(size(5));
f1=zeros(size(5));
p=1;

for n=4:2:12
    A=zeros(n,n);
    S=zeros(n,n);
    D=zeros(n,n);

    f=a+(b-a)*rand(n,1);
for i=1:n
    for j=1:n
        A(i,j)=1/(i+j+10);
    end
end

for i=1:n
        sum = 0;
            for k=1:i-1
            sum =sum+ abs(S(k,i)^2)*D(k,k);
            end
        D(i,i)=sign(A(i,i)-sum);
        S(i,i)=sqrt(abs(A(i,i)-sum));
        for j=i+1:n
        sum2=0;
            for k=1:i-1
                sum2=sum2+ S(k,i)*D(k,k)*S(k,j);
            end
        S(i,j)=(A(i,j)-sum2)/(S(i,i)*D(i,i));
        end
end


y=zeros(n,1);
y(1,1)=f(1,1)/(S(1,1)*D(1,1));
for i=2:n
    sum=0;
    for j=1:i-1
            sum =sum+ S(j,i)*y(j,1)*D(j,j);
    end
            y(i,1)=(f(i,1)-sum)/(S(i,i)*D(i,i));
end

x=zeros(n,1);
x(n,1)=y(n,1)/S(n,n);
for i=n-1:-1:1
    sum=0;
    for j=i+1:n
            sum =sum+ S(i,j)*x(j,1);
    end
    x(i,1)= (y(i,1)-sum)/S(i,i);
end
  Norm1(p)=norm(f-A*x)/norm(f);
  p=p+1;
end
Norm1(1)
Norm1(2)
Norm1(3)
Norm1(4)
Norm1(5)
semilogy(4:2:12,Norm1,'r*');
legend('Norms')


