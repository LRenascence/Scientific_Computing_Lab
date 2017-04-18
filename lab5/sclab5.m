x=[0.5;1.1;1.7;2.1;2.5;2.9;3.3;3.7;4.2;4.9;5.3;6.0];
y=[1.6;2.4;3.8;4.3;4.7;4.8;5.5;6.1;6.3;7.1;7.1;8.2];
%题目1
%生成矩阵A
A=[ones(length(x),1),x];
%用正规方程组解
xres=Normal_equation(A,y);
%画图
figure;
plot(x,y,'b.');
hold on;
xprime=0:0.1:10;
yprime=xres(2)*xprime+xres(1);
plot(xprime,yprime,'r-');
axis([0, 10, 0,10]);
%题目2
%生成矩阵A
A=[ones(length(x),1),y];
%用正规方程组解
xres=Normal_equation(A,x);
%画图
figure;
plot(x,y,'b.');
hold on;
yprime=0:0.1:10;
xprime=xres(2)*yprime+xres(1);
plot(xprime,yprime,'r-');
axis([0, 10, 0,10]);
%题目3
%生成矩阵A
A=[ones(length(x),1),x,y];
%svd分解
[U,S,V]=svd(A);
%计算极小范数解
xres=-1/V(3,3)*V(1:2,3);
disp('SVD方法的解是');
xres
residual=norm(y-[ones(length(x),1),x]*xres);
disp(['SVD方法的解的残差是',num2str(residual)]);
%画图
figure;
plot(x,y,'b.');
hold on;
xprime=0:0.1:10;
yprime=xres(2)*xprime+xres(1);
plot(xprime,yprime,'r-');
axis([0, 10, 0,10]);
