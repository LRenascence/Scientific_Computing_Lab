function x =solveup(U,b)
[row,col]=size(U);
x=zeros(row,1);
for j=row:-1:1
    %����������죬��ֹͣ
    if U(j,j)==0
        disp('�þ�������');
        break;
    end
    %�����ķ���
   x(j)=b(j)/U(j,j);
   for i=1:j-1
       b(i)=b(i)-U(i,j)*x(j);
   end
end
end

