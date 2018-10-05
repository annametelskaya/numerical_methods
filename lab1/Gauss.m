function [A,n,d]=Gauss(A,n,d)
for i=1:n
    d=A(i,i)*d;
    A(i,:) = A(i,:)/A(i,i);
    for j= i+1:n
        A(j,:)=A(j,:)-A(i,:)*A(j,i);
    end
end

