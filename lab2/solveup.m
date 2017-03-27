function x =solveup(U,b)
[row,col]=size(U);
x=zeros(row,1);
for j=row:-1:1
    %如果矩阵奇异，则停止
    if U(j,j)==0
        disp('该矩阵奇异');
        break;
    end
    %计算解的分量
   x(j)=b(j)/U(j,j);
   for i=1:j-1
       b(i)=b(i)-U(i,j)*x(j);
   end
end
end

