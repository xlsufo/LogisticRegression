function [dJ] = funcdCost(x,y,theta,numClasses)
% x为输入的图片拓展矩阵
% y为1-10的参数表
% theta为模型参数
[r,c]=size(x);  %r为图片向量维数+1，c为图片数
dJ=theta.*0;

for k=1:numClasses
    for i=1:c
        a=sum(exp(theta(:,1:numClasses)'*x(:,i)));
        p_k=exp(theta(:,k)'*x(:,i))/a;
        if y(i)==k
            mid=x(:,i)*(1-p_k);
        else
            mid=x(:,i)*(-p_k);
        end
        dJ(:,k)=dJ(:,k)+mid;
    end
end
 dJ=- dJ/c;
end
 

