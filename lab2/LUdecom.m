function[P,L,U]=LUdecom(A)
[row,col]=size(A);
U=A;
P=eye(row);%最后返回的排列阵P
L=eye(row);
for k=1:row-1
    p=k;
    %在当前列选主元
    for j=k:row
        if abs(U(j,k))>abs(U(p,k));
            p=j;
        end
    end
    %如果需要交换
    if p~=k;
        Pp=eye(row);%中间计算用排列阵Pp
        Pp([p;k],:)=Pp([k;p],:);
        U([p;k],:)=U([k;p],:);
        P=Pp*P;
        L=Pp*L;
        %U=Pp*U;
    end
    %如果主元为0，跳过
    if U(k,k)==0
        continue;
    end
    %计算当前列的乘数
    m=eye(row);
    for i=k+1:row
        m(i,k)=-U(i,k)/U(k,k);
    end
    %对剩余的子矩阵进行变换
    L=m*L;
    %U=m*U;
    for j=k:row
        for i=k+1:row
            U(i,j)=U(i,j)+m(i,k)*U(k,j);
        end
    end
end
%求L，并重排为下三角矩阵
L=inv(L);
L=P*L;
end
