function [xres]=Normal_equation(A,b)
%ʹ��Cholesky�ֽ�
L=Cholesky(A'*A)
%�������Ǿ���;
xres=solvelow(L,A'*b);
%�������Ǿ���
xres=solveup(L',xres);
%����в�
residual=norm(b-A*xres);
disp('���淽���鷽���Ľ���');
xres
disp(['���淽���鷽���Ľ�Ĳв���',num2str(residual)]);