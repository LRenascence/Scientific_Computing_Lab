function[xres] = Jacobi(A,b,eps)
%取A的对角元素组成的对角矩阵
D=diag(diag(A));
%取A的严格下三角矩阵
L=tril(A,-1);
%取A的严格上三角矩阵
U=triu(A,1);
%解的初始值
x0=zeros(length(b),1);
%记录轮数
count=1;
%迭代方程
xres=inv(D)*(b-(L+U)*x0);
while norm(xres-x0)>=eps;
    count=count+1;
    x0=xres;
    xres=inv(D)*(b-(L+U)*x0);
end
xres
fprintf('迭代次数: %d\n',count);
