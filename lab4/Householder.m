function [xres]=Householder(A,b)
[row,col]=size(A);
for k=1:col
    %计算当前列的Householder向量
    a=0;
    for i=k:row
        a=a+A(i,k)^2;
    end
    a=-1*sign(A(k,k))*sqrt(a);
    v=zeros(row,1);
    for i=k:row
        v(i)=A(i,k);
    end
    e=zeros(row,1);
    e(k)=1;
    v=v-a*e;
    %计算出H，对b进行处理
    H=eye(row)-2*(v*v')/(v'*v);
    b=H*b;
    beta=v'*v;
    %如果当前列已经为0，跳过
    if beta==0
        continue;
    end
    %对剩余的子矩阵做变换
    for j=k:col
        gamma=v'*A(:,j);
        A(:,j)=A(:,j)-(2*gamma/beta)*v;
    end
end
U=triu(A(1:col,:),-1);
xres=solveup(U,b(1:col));
residual=norm(b(col+1:length(b)));
disp('Householder方法的解是');
xres
disp(['Householder方法的解的残差是',num2str(residual)]);