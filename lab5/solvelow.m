function x=solvelow(L,b)
[row,~]=size(L);
x=zeros(row,1);
for j=1:row
    %如果该矩阵奇异，则停止
    if L(j,j)==0
        disp('该矩阵奇异');
        break;
    end
    %计算解的分量
    x(j)=b(j)/L(j,j);
    %修正右端向量
    for i=j+1:row
        b(i)=b(i)-L(i,j)*x(j);
    end
end
