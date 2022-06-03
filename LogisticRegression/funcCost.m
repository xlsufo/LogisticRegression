function [outL] = funcCost(x,y,theta)
% 求解损失函数
[r,c]=size(x);
L=0;
for i=1:r
  L=L+(-y(i)*theta'*x(i,:)'+log(1+exp(theta'*x(i,:)')));
end
  outL=L/r;
end

