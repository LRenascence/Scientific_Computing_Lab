function[xres] = Jacobi(A,b,eps)
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
xres=inv(D)*(b-(L+U)*x0);
while norm(xres-x0)>=eps;
    count=count+1;
    x0=xres;
    xres=inv(D)*(b-(L+U)*x0);
end
xres
fprintf('��������: %d\n',count);
