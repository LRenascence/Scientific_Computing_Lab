function [A,b]=Laplace(n,leftvalue,rightvalue,upvalue,downvalue)
N=n^2;%解的个数
A=zeros(N,N);%参数方程
b=zeros(N,1);
index=0;%点的索引序号
for i=1:n
    for j=1:n
        index=index+1;
        left=index-1;%当前点左边点的索引
        right=index+1;%当前点右边点的索引
        down=index-n;%当前点上边点的索引引
        up=index+n;%当前点下边点的索引
        %若当前点处于顶点位置
        if index==1%若当前点处于左下顶点
            A(index,index)=4;
            A(index,right)=-1;
            A(index,up)=-1;
            b(index)=leftvalue+downvalue;
        elseif index==n%若当前点处于右下顶点
            A(index,index)=4;
            A(index,left)=-1;
            A(index,up)=-1;
            b(index)=rightvalue+downvalue;
        elseif index==n*(n-1)+1%若当前顶点处于左上顶点
            A(index,index)=4; 
            A(index,right)=-1;
            A(index,down)=-1;
            b(index)=leftvalue+upvalue;;
        elseif index==N%若当前顶点处于右上顶点
            A(index,index)=4; 
            A(index,left)=-1;
            A(index,down)=-1;
            b(index)=rightvalue+upvalue;
        %若当前点在边上，不包含顶点
        elseif i==1%靠近下边界的边
            A(index,index)=4;
            A(index,right)=-1;
            A(index,left)=-1;
            A(index,up)=-1;
            b(index)=downvalue;
        elseif j==1%靠近左边界的边
            A(index,index)=4;
            A(index,down)=-1;
            A(index,right)=-1;
            A(index,up)=-1;
            b(index)=leftvalue;
        elseif i==n%靠近上边界的边
            A(index,index)=4;
            A(index,right)=-1;
            A(index,down)=-1;
            A(index,left)=-1;
            b(index)=upvalue;
        elseif j==n%靠近右边界的边
            A(index,index)=4;
            A(index,left)=-1;
            A(index,down)=-1;
            A(index,up)=-1;
            b(index)=rightvalue;
        %当前点位于中部
        else
            A(index,index)=4;
            A(index,left)=-1;
            A(index,right)=-1;
            A(index,down)=-1;
            A(index,up)=-1;
        end
    end
end
