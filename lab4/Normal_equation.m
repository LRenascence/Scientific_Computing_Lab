function [xres]=Normal_equation(A,b)
%使用Cholesky分解
L=Cholesky(A'*A)
%解下三角矩阵;
xres=solvelow(L,A'*b);
%解上三角矩阵
xres=solveup(L',xres);
%计算残差
residual=norm(b-A*xres);
disp('正规方程组方法的解是');
xres
disp(['正规方程组方法的解的残差是',num2str(residual)]);