function [A,b]=Laplace(n,leftvalue,rightvalue,upvalue,downvalue)
N=n^2;%��ĸ���
A=zeros(N,N);%��������
b=zeros(N,1);
index=0;%����������
for i=1:n
    for j=1:n
        index=index+1;
        left=index-1;%��ǰ����ߵ������
        right=index+1;%��ǰ���ұߵ������
        down=index-n;%��ǰ���ϱߵ��������
        up=index+n;%��ǰ���±ߵ������
        %����ǰ�㴦�ڶ���λ��
        if index==1%����ǰ�㴦�����¶���
            A(index,index)=4;
            A(index,right)=-1;
            A(index,up)=-1;
            b(index)=leftvalue+downvalue;
        elseif index==n%����ǰ�㴦�����¶���
            A(index,index)=4;
            A(index,left)=-1;
            A(index,up)=-1;
            b(index)=rightvalue+downvalue;
        elseif index==n*(n-1)+1%����ǰ���㴦�����϶���
            A(index,index)=4; 
            A(index,right)=-1;
            A(index,down)=-1;
            b(index)=leftvalue+upvalue;;
        elseif index==N%����ǰ���㴦�����϶���
            A(index,index)=4; 
            A(index,left)=-1;
            A(index,down)=-1;
            b(index)=rightvalue+upvalue;
        %����ǰ���ڱ��ϣ�����������
        elseif i==1%�����±߽�ı�
            A(index,index)=4;
            A(index,right)=-1;
            A(index,left)=-1;
            A(index,up)=-1;
            b(index)=downvalue;
        elseif j==1%������߽�ı�
            A(index,index)=4;
            A(index,down)=-1;
            A(index,right)=-1;
            A(index,up)=-1;
            b(index)=leftvalue;
        elseif i==n%�����ϱ߽�ı�
            A(index,index)=4;
            A(index,right)=-1;
            A(index,down)=-1;
            A(index,left)=-1;
            b(index)=upvalue;
        elseif j==n%�����ұ߽�ı�
            A(index,index)=4;
            A(index,left)=-1;
            A(index,down)=-1;
            A(index,up)=-1;
            b(index)=rightvalue;
        %��ǰ��λ���в�
        else
            A(index,index)=4;
            A(index,left)=-1;
            A(index,right)=-1;
            A(index,down)=-1;
            A(index,up)=-1;
        end
    end
end
