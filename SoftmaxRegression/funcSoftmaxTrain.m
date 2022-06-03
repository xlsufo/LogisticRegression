function [softmaxModel] = funcSoftmaxTrain(dfuncCost,funcCost,trainPara,theta0,numClasses,x,y)
%dfuncCost 损失函数梯度，函数句柄
%funcCost 损失函数，函数句柄
%trainPara 训练时的相关参数
%theta0 模型初值
%numClasses 分类数
%x 训练集图片
%y 训练集列表

%梯度下降法求解最优值
iter = 1;% 迭代次数
lossMax=trainPara.lossMax; % 最大容许损失
iterMax=trainPara.iterMax; % 最大迭代次数
lossLimt=trainPara.lossLimt;
alpha=trainPara.alpha; %求解步长
theta{1,iterMax+1}=theta0;
loss(1,1:iterMax)=inf;%损失率
for i=iter:iterMax+1
    theta{1,i}=theta0;
end

while iter<iterMax+1
    %----Newton迭代过程------------%
    dLbeta=dfuncCost(x,y,theta{1,iter},numClasses);
    if(loss(1,iter)<lossLimt)
        alpha=alpha*0.618;
    end
    theta{1,iter+1}=theta{1,iter}-alpha*dLbeta;
    
    loss(1,iter)=funcCost(x,y,theta{1,iter+1},numClasses);
    
    % 迭代终止条件：找到满足损失率的解
    if loss(1,iter)<lossMax
        disp('找到满足损失率的解！')
        disp(['迭代次数为',num2str(iter)]);
        disp(['erro= ',num2str(loss(1,iter))]);
        break;
    end
    disp(['迭代次数：',num2str(iter),'，损失率= ',num2str(loss(1,iter))]);
    iter = iter+1;  %迭代数增加
end
softmaxModel.theta=theta{1,iter};
softmaxModel.loss=loss(1,1:iter-1);
end

