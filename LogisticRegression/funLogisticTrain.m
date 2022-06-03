function [logisticModel] = funLogisticTrain(dfuncCost,funcCost,solvePara,theta0,x,y)
%梯度下降法求解最优值
%   
iter = 1;% 迭代次数
lossTem=inf;
lossMax=solvePara.lossMax; % 最大容许误差
iterMax=solvePara.iterMax; % 最大迭代次数
alpha=solvePara.alpha; %求解步长
errLimt=solvePara.errLimt;  %等步长到变步长的切换界限
eta=solvePara.eta; %迭代步长变化率 
theta(:,iterMax+1)=theta0;
for i=iter:iterMax+1
    theta(:,i)=theta0;
end
loss(1,1:iterMax)=inf; %损失率
while iter<iterMax+1

    dLbeta=dfuncCost(x,y,theta(:,iter));
    if(lossTem<errLimt)
        alpha=eta*alpha;
    end
    theta(:,iter+1)=theta(:,iter)-alpha.*dLbeta;
    loss(1,iter)=funcCost(x,y,theta(:,iter+1));
    % 迭代终止条件：找到满足精度要求的解
    if loss(1,iter)<lossMax
        disp('求解收敛')
        disp(['迭代次数为',num2str(iter)]);
        disp(['erro= ',num2str(max(lossTem))]);
        disp(['训练集概率损失= ',num2str(objFunc(gX,y,theta(:,iter)))]);
        break;
    end
    disp(['迭代次数：',num2str(iter),'，损失率= ',num2str(loss(1,iter))]);
    iter = iter+1;  %迭代数增加
end
logisticModel.theta=theta(:,1:iter);
logisticModel.loss=loss(1,1:iter-1);
end

