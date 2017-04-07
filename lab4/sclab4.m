clear all;
clc;
%��ʼ��A�����b����
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
%�����A��������
invA=inv(A'*A)*A';
cond=norm(A)*norm(invA);
disp(['A�����������Ϊ',num2str(cond)]);
%�����淽��������
xres=Normal_equation(A,b);
%����Ax��b�ļнǵ�����ֵ
cos=norm(A*xres)/norm(b);
disp(['Ax��b�нǵ�����ֵΪ',num2str(cos)]);
%��Householder���������
xres=Householder(A,b);



