clear;
clc;

a=1;
b=2;
n=10;
eps=10^(-3);
A=zeros(n,n);
E=eye(n,n);
f=a+(b-a)*rand(n,1);
col=['m','b','r'];
for i=1:n
    for j=1:n
            if i~=j
                A(i,j)=1/(i+j+1);
            end
            if i==j
                A(i,j)=100+1;
            end
    end
end
t=[1/(2*norm(A)),1/(4*norm(A)),1/(8*norm(A))];
for s=1:3
    H = E-t(s)*A;
    q=norm(H);
    fi=t(s)*f;
    xs=fi;
    xn = H*xs + fi;
    k=1;
    while(q/(1-q))*norm(xn-xs)>eps
        res(k)= (q/(1-q))*norm(xn-xs);
        k=k+1;
        xs=xn;
        xn=H*xs+fi;
    end
    plot(1:k-1,res,col(s))
    hold on;
end
legend('t1','t2','t3')