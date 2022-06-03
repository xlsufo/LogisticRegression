function [L] = funcCost(x,y,theta,numClasses)
% x为输入的图片拓展矩阵
% y为1-10的参数表
% theta为模型参数
[r,c]=size(x);  %r为图片像素向量数+1，c为图片数
L=0;

for i=1:c
    mid1=0;
    mid2=0;
    for k=1:numClasses
        if y(i)==k
           a=sum(exp(theta(:,1:k)'*x(:,i)));
           p_k=exp(theta(:,k)'*x(:,i))/a;
           mid1=log(p_k);
           mid2=mid2+mid1;
        else
        end
       
    end
    L=L+mid2;
end
 L = -L/c;
end

