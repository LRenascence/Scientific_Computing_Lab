%牛顿法
%初始化参数
x0=[-0.5;1.4];
xtrue=[0;1];
k=0;
while true
    k=k+1;
    %计算当前x的Jacobian矩阵
    J=[x0(2)^3-7,3*(x0(1)+2)*x0(2)^2;
       x0(2)*exp(x0(1))*cos(x0(2)*exp(x0(1)-1)),exp(x0(1))*cos(x0(2)*exp(x0(1))-1)];
    %计算当前x的函数值
    F=[(x0(1)+3)*(x0(2)^3-7)+18;sin(x0(2)*exp(x0(1))-1)];
    %计算步长
    s=inv(J)*(-F);
    %修正解
    x0=x0+s;
    if norm(x0-xtrue)<1e-10
        break;
    end
%     if norm(x0-xtrue)<1e-10
%         break;
%     end
end
disp('牛顿法的近似解')
x0
disp(['牛顿法的迭代次数k=',num2str(k)])

%Broyden方法
%初始化参数
x0=[-0.5;1.4];
%因为没有相关信息，所以将B初始化为单位矩阵
B=eye(2);
xtrue=[0;1];
k=0;
while true
    k=k+1;
    F0=[(x0(1)+3)*(x0(2)^3-7)+18;sin(x0(2)*exp(x0(1))-1)];
    %计算步长
    s=inv(B)*(-F0);
    %更新解
    x1=x0+s;
    F1=[(x1(1)+3)*(x1(2)^3-7)+18;sin(x1(2)*exp(x1(1))-1)];
    y=F1-F0;
    %更新B矩阵
    B=B+((y-B*s)*s')/(s'*s);
    x0=x1;
    if norm(x0-xtrue)<1e-10
        break
    end
end
disp('Broyden方法的近似解')
x0
disp(['Broyden方法的迭代次数k=',num2str(k)])