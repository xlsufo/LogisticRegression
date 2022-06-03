function [dL] = funcdCost(x,y,theta)
% 求解代价函数的一阶导
[r,c]=size(x);
dL=theta.*0;
for i=1:r
    p1=exp(theta'*x(i,:)')/(1+exp(theta'*x(i,:)'));
    dL=dL+x(i,:)'*(y(i)-p1);
end
   dL=-dL/r;
end

