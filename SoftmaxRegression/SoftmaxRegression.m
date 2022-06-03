clc;clear;

%--加载数据----------------------------------------%
load '../PreTreatedData/trainImages.mat';
load '../PreTreatedData/trainLabels.mat';
load '../PreTreatedData/testImages.mat';
load '../PreTreatedData/testLabels.mat';

%--训练---------------------------------------------------%
%iter = 0;% 迭代次数
trainPara.lossMax = 0.01; % 最大损失率
trainPara.iterMax = 2000; % 最大训练次数
%trainPara.alpha = ones(c+1,1).*0.001; % 迭代步长
trainPara.alpha = 0.1; % 学习率
trainPara.lossLimt=0.01;  %等步长到变步长的切换界限
trainPara.eta = 0.618; %迭代学习率变化率 
trainPara.num2Train=10000;  %选取要训练的图片数量

%trainImage.data每一行代表一张图片
[r,c]=size(trainImage.data(1:trainPara.num2Train,:)); 
%归一化，选取10000张图片，X的拓展矩阵,同时转置  
X_hat=[trainImage.data(1:trainPara.num2Train,:)./255 ones(r,1)]'; 

y=trainLabel.data(1:trainPara.num2Train)+1;  %将值偏移到1-10
numClasses=10;

theta0=[ones(c,numClasses)./c;zeros(1,numClasses)]; %模型权重初值

softmaxModel=funcSoftmaxTrain(@funcdCost,@funcCost,trainPara,theta0,numClasses,X_hat,y);

figure;
xplot=(1:trainPara.iterMax);
plot(xplot,softmaxModel.loss); 
%set(gcf,'unit','centimeters','position',[20 5 7 6]);
xlabel('numOfIter');
ylabel('Loss');
xlim([-200 2200]);
ylim([0 1.6]);


%--测试---------------------------------------------------%
[r_test,c_test]=size(testImage.data);
y_test=testLabel.data+1;     %训练集列表，偏移1
X_hat_test=[testImage.data./255 ones(r_test,1)]';  %归一化，获取拓展矩阵,转置
accuracy=funcSoftmaxTest(softmaxModel.theta,numClasses,X_hat_test,y_test); %进入测试
disp(['识别准确率为',num2str(accuracy*100),'%']);
