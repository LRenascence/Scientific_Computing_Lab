for i=0:0.01:5
    plot(i,i^3-2*i-5,'b.');
    plot(i,0,'r.');
    hold on;
end
%二分法
%初始化参数
a=2;
b=3;
tol=1e-5;
k=0;
while true
    k=k+1;
    m=a+(b-a)/2;
    if sign(a^3-2*a-5)==sign(m^3-2*m-5)
        a=m;
    else
        b=m;
    end
    if b-a<=tol
        break;
    end
end
disp('二分法，初始区间[2,3]')
disp(['近似解为x=',num2str(a)])
disp(['迭代次数k=',num2str(k)])
%牛顿法
%初始化参数
x0=2;
k=0;
tol=1e-5;
while true
    k=k+1;
    f=x0^3-2*x0-5;
    fprime=3*x0^2-2;
    x0=x0-f/fprime;
    if abs(x0^3-2*x0-5)<tol
        break;
    end
end
disp('牛顿法，初始X0=2')
disp(['近似解为x=',num2str(x1)])
disp(['迭代次数k=',num2str(k)])
%割线法
%初始化参数
x0=2;
x1=3;
k=0;
tol=1e-5;
while true
    k=k+1;
    f0=x0^3-2*x0-5;
    f1=x1^3-2*x1-5;
    x2=x1-f1*(x1-x0)/(f1-f0);
    x0=x1;
    x1=x2;
    if abs(x1^3-2*x1-5)<tol
        break;
    end
end
disp('割线法，初始区间[2,3]')
disp(['近似解为x=',num2str(x1)])
disp(['迭代次数k=',num2str(k)])