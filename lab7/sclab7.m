%ţ�ٷ�
%��ʼ������
x0=[-0.5;1.4];
xtrue=[0;1];
k=0;
while true
    k=k+1;
    %���㵱ǰx��Jacobian����
    J=[x0(2)^3-7,3*(x0(1)+2)*x0(2)^2;
       x0(2)*exp(x0(1))*cos(x0(2)*exp(x0(1)-1)),exp(x0(1))*cos(x0(2)*exp(x0(1))-1)];
    %���㵱ǰx�ĺ���ֵ
    F=[(x0(1)+3)*(x0(2)^3-7)+18;sin(x0(2)*exp(x0(1))-1)];
    %���㲽��
    s=inv(J)*(-F);
    %������
    x0=x0+s;
    if norm(x0-xtrue)<1e-10
        break;
    end
%     if norm(x0-xtrue)<1e-10
%         break;
%     end
end
disp('ţ�ٷ��Ľ��ƽ�')
x0
disp(['ţ�ٷ��ĵ�������k=',num2str(k)])

%Broyden����
%��ʼ������
x0=[-0.5;1.4];
%��Ϊû�������Ϣ�����Խ�B��ʼ��Ϊ��λ����
B=eye(2);
xtrue=[0;1];
k=0;
while true
    k=k+1;
    F0=[(x0(1)+3)*(x0(2)^3-7)+18;sin(x0(2)*exp(x0(1))-1)];
    %���㲽��
    s=inv(B)*(-F0);
    %���½�
    x1=x0+s;
    F1=[(x1(1)+3)*(x1(2)^3-7)+18;sin(x1(2)*exp(x1(1))-1)];
    y=F1-F0;
    %����B����
    B=B+((y-B*s)*s')/(s'*s);
    x0=x1;
    if norm(x0-xtrue)<1e-10
        break
    end
end
disp('Broyden�����Ľ��ƽ�')
x0
disp(['Broyden�����ĵ�������k=',num2str(k)])