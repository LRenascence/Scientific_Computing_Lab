t=[0;0.5;1;6;7;9];
y=[0;1.6;2;2;1.5;0];
n=6;
%����ʽ������
figure;
%����ϵ������
A=zeros(n);
for i=1:n
    for j=1:n
        A(i,j)=t(i)^(j-1);
    end
end
%�ⷽ��
xres=inv(A)*y;
%��ͼ
plot(t,y,'b+','MarkerSize',14);
hold on;
for i=-1:0.01:10
    yres=xres(1)+xres(2)*i+xres(3)*i^2+xres(4)*i^3+xres(5)*i^4+xres(6)*i^5;
    plot(i,yres,'r.');
end
%Lagrange������
figure;
syms x;
%����Lagrange������
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
%��ͼ
plot(t,y,'b+','MarkerSize',14);
hold on;
for i=-1:0.01:10
    x=i;
    plot(x,eval(p),'r.');
end
%Newton������
figure;
syms x
%����Newton������
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
%�ⷽ��
xres=solvelow(A,y);
%����Newton������
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
% ��ͼ
plot(t,y,'b+','MarkerSize',14);
hold on;
for i=-1:0.01:10
    x=i;
    plot(x,eval(p),'r.');
end