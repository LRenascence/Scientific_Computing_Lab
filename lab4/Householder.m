function [xres]=Householder(A,b)
[row,col]=size(A);
for k=1:col
    %���㵱ǰ�е�Householder����
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
    %�����H����b���д���
    H=eye(row)-2*(v*v')/(v'*v);
    b=H*b;
    beta=v'*v;
    %�����ǰ���Ѿ�Ϊ0������
    if beta==0
        continue;
    end
    %��ʣ����Ӿ������任
    for j=k:col
        gamma=v'*A(:,j);
        A(:,j)=A(:,j)-(2*gamma/beta)*v;
    end
end
U=triu(A(1:col,:),-1);
xres=solveup(U,b(1:col));
residual=norm(b(col+1:length(b)));
disp('Householder�����Ľ���');
xres
disp(['Householder�����Ľ�Ĳв���',num2str(residual)]);