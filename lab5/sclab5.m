x=[0.5;1.1;1.7;2.1;2.5;2.9;3.3;3.7;4.2;4.9;5.3;6.0];
y=[1.6;2.4;3.8;4.3;4.7;4.8;5.5;6.1;6.3;7.1;7.1;8.2];
%��Ŀ1
%���ɾ���A
A=[ones(length(x),1),x];
%�����淽�����
xres=Normal_equation(A,y);
%��ͼ
figure;
plot(x,y,'b.');
hold on;
xprime=0:0.1:10;
yprime=xres(2)*xprime+xres(1);
plot(xprime,yprime,'r-');
axis([0, 10, 0,10]);
%��Ŀ2
%���ɾ���A
A=[ones(length(x),1),y];
%�����淽�����
xres=Normal_equation(A,x);
%��ͼ
figure;
plot(x,y,'b.');
hold on;
yprime=0:0.1:10;
xprime=xres(2)*yprime+xres(1);
plot(xprime,yprime,'r-');
axis([0, 10, 0,10]);
%��Ŀ3
%���ɾ���A
A=[ones(length(x),1),x,y];
%svd�ֽ�
[U,S,V]=svd(A);
%���㼫С������
xres=-1/V(3,3)*V(1:2,3);
disp('SVD�����Ľ���');
xres
residual=norm(y-[ones(length(x),1),x]*xres);
disp(['SVD�����Ľ�Ĳв���',num2str(residual)]);
%��ͼ
figure;
plot(x,y,'b.');
hold on;
xprime=0:0.1:10;
yprime=xres(2)*xprime+xres(1);
plot(xprime,yprime,'r-');
axis([0, 10, 0,10]);
