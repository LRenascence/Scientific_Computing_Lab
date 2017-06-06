t=[0;0.5;1;6;7;9];
y=[0;1.6;2;2;1.5;0];
n=6;
%单项式基函数
figure;
%构造系数矩阵
A=zeros(n);
for i=1:n
    for j=1:n
        A(i,j)=t(i)^(j-1);
    end
end
%解方程
xres=inv(A)*y;
%绘图
plot(t,y,'b+','MarkerSize',14);
hold on;
for i=-1:0.01:10
    yres=xres(1)+xres(2)*i+xres(3)*i^2+xres(4)*i^3+xres(5)*i^4+xres(6)*i^5;
    plot(i,yres,'r.');
end
%Lagrange基函数
figure;
syms x;
%构造Lagrange基函数
p=0;
for i=1:n
    factor=y(i);
    for j=1:n
        if i==j
            continue;
        end
        factor=factor*(x-t(j))/(t(i)-t(j));
    end
    p=p+factor;
end
%绘图
plot(t,y,'b+','MarkerSize',14);
hold on;
for i=-1:0.01:10
    x=i;
    plot(x,eval(p),'r.');
end
%Newton基函数
figure;
syms x
%构造Newton基矩阵
A=ones(n);
for i=1:n
    for j=1:n
        if j==1
            continue;
        end
        if j>i
            A(i,j)=0;
            continue;
        end
        for jj=1:j-1
            A(i,j)=A(i,j)*(t(i)-t(jj));
        end
    end
end
%解方程
xres=solvelow(A,y);
%构造Newton基函数
p=0;
for i=1:n
    factor=xres(i);
    for j=1:n
        if i<=j
            break;
        end
        factor=factor*(x-t(j));
    end
    p=p+factor;
end
% 绘图
plot(t,y,'b+','MarkerSize',14);
hold on;
for i=-1:0.01:10
    x=i;
    plot(x,eval(p),'r.');
end