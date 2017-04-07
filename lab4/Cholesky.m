function L=Cholesky(A)
[row,~]=size(A);
%获得下三角矩阵
L=tril(A,0);
for k=1:row
    L(k,k)=sqrt(L(k,k));
    %调整当前列
    for i=k+1:row
        L(i,k)=L(i,k)/L(k,k);
    end
    %从剩余的列中，减去当前列的倍数
    for j=k+1:row
        for i=k+1:row
            L(i,j)=L(i,j)-L(j,k)*L(i,k);
        end
    end
end