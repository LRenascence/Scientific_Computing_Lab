function[P,L,U]=LUdecom(A)
[row,col]=size(A);
U=A;
P=eye(row);%��󷵻ص�������P
L=eye(row);
for k=1:row-1
    p=k;
    %�ڵ�ǰ��ѡ��Ԫ
    for j=k:row
        if abs(U(j,k))>abs(U(p,k));
            p=j;
        end
    end
    %�����Ҫ����
    if p~=k;
        Pp=eye(row);%�м������������Pp
        Pp([p;k],:)=Pp([k;p],:);
        U([p;k],:)=U([k;p],:);
        P=Pp*P;
        L=Pp*L;
        %U=Pp*U;
    end
    %�����ԪΪ0������
    if U(k,k)==0
        continue;
    end
    %���㵱ǰ�еĳ���
    m=eye(row);
    for i=k+1:row
        m(i,k)=-U(i,k)/U(k,k);
    end
    %��ʣ����Ӿ�����б任
    L=m*L;
    %U=m*U;
    for j=k:row
        for i=k+1:row
            U(i,j)=U(i,j)+m(i,k)*U(k,j);
        end
    end
end
%��L��������Ϊ�����Ǿ���
L=inv(L);
L=P*L;
end
