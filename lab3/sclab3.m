clear all;
clc;
%原始方程组
A=[4,-1,1;
   4,-8,1;
   -2,1,5];
b=[7;-21;15];
xres=Jacobi(A,b,1e-5);
%交换后的方程组
Aprime=[-2,1,5;
        4,-8,1;
        4,-1,1];
bprime=[15;-21;7];
xresp=Jacobi(Aprime,bprime,1e-5);
% 生成拉普拉斯方程组
[A,b]=Laplace(6,0,0,1,0);
disp('Jacobi result');
xres=Jacobi(A,b,1e-5);
disp('Gauss_Seidel result');
xres=Gauss_Seidel(A,b,1e-5);
disp('SOR result');
xres=SOR(A,b,1.4,1e-5);