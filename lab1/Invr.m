function [C,n,f,x]= Invr(C,n,f,x)
for i=1:n
    f(i,:)=f(i,:)/C(i,i);
    
    for k=i+1:n
        C(i,k) = C(i,k)/C(i,i);
    end
    
    for j= i+1:n
        f(j,:)=f(j,:)-f(i,:)*C(j,i);
        for k=i+1:n
            C(j,k)=C(j,k)-C(j,i)*C(i,k);
         end
    end
end

x(n,:)=f(n,:);
for i=n-1:-1:1
    sum = 0;
    for m=i+1:n
       sum =sum+ C(i,m)*x(m,:);
    end
    x(i,:)=f(i,:)- sum;
end
