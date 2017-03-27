clear all;
clc;
% 部分列主元的LU分解
A=[0.0,85.0,56.0,54.0;
   76.0,63.0,7.0,20.0;
   21.0,67.0,88.0,73.0;
   19.3,43.0,30.2,29.4];
b=[218.0;109.0;141.0;93.7];
[P,L,U]=LUdecom(A);
Pb=P*b;
x=solvelow(L,Pb);
disp('方程的解为')
x=solveup(U,x)
disp('残差为')
r=b-A*x
% 对称正定矩阵的Cholesky分解
H5=hilb(5);
H6=hilb(6);
H7=hilb(7);
H8=hilb(8);
b5=H5*ones(5,1);
b6=H6*ones(6,1);
b7=H7*ones(7,1);
b8=H8*ones(8,1);
disp('n=5');
L5=Cholesky(H5);
x5=solvelow(L5,b5);
x5=solveup(L5',x5);
r5=b5-H5*x5
infinite5=max(abs(x5-ones(5,1)))
disp('n=6');
L6=Cholesky(H6);
x6=solvelow(L6,b6);
x6=solveup(L6',x6);
r6=b6-H6*x6
infinite6=max(abs(x6-ones(6,1)))
disp('n=7');
L7=Cholesky(H7);
x7=solvelow(L7,b7);
x7=solveup(L7',x7);
r7=b7-H7*x7
infinite7=max(abs(x7-ones(7,1)))
disp('n=8');
L8=Cholesky(H8);
x8=solvelow(L8,b8);
x8=solveup(L8',x8);
r8=b8-H8*x8
infinite8=max(abs(x8-ones(8,1)))


