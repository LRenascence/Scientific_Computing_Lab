function x=solvelow(L,b)
[row,~]=size(L);
x=zeros(row,1);
for j=1:row
    %����þ������죬��ֹͣ
    if L(j,j)==0
        disp('�þ�������');
        break;
    end
    %�����ķ���
    x(j)=b(j)/L(j,j);
    %�����Ҷ�����
    for i=j+1:row
        b(i)=b(i)-L(i,j)*x(j);
    end
end
