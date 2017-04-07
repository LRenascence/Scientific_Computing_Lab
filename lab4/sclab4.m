clear all;
clc;
%初始化A矩阵和b向量
A=zeros(11,8);
b=zeros(11,1);
x=2.0;
for i=1:11
    for j=1:8
        A(i,j)=x^j;
        b(i)=b(i)+x^j;
    end
    x=x+0.2;
end
%求矩阵A的条件数
invA=inv(A'*A)*A';
cond=norm(A)*norm(invA);
disp(['A矩阵的条件数为',num2str(cond)]);
%用正规方程组计算解
xres=Normal_equation(A,b);
%计算Ax与b的夹角的余弦值
cos=norm(A*xres)/norm(b);
disp(['Ax与b夹角的余弦值为',num2str(cos)]);
%用Householder方法计算解
xres=Householder(A,b);



