function[xres]=SOR(A,b,omega,eps)
%ȡA�ĶԽ�Ԫ����ɵĶԽǾ���
D=diag(diag(A));
%ȡA���ϸ������Ǿ���
L=tril(A,-1);
%ȡA���ϸ������Ǿ���
U=triu(A,1);
%��ĳ�ʼֵ
x0=zeros(length(b),1);
%��¼����
count=1;
%��������
xres=inv(D+omega*L)*((1-omega)*D-omega*U)*x0+omega*inv(D+omega*L)*b;
while norm(xres-x0)>=eps;
    count=count+1;
    x0=xres;
    xres=inv(D+omega*L)*((1-omega)*D-omega*U)*x0+omega*inv(D+omega*L)*b;
end
xres
fprintf('��������: %d\n',count);
