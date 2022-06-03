clc;clear;

%--加载数据----------------------------------------%
load '../PreTreatedData/trainImages.mat';
load '../PreTreatedData/trainLabels.mat';
load '../PreTreatedData/testImages.mat';
load '../PreTreatedData/testLabels.mat';

trainImage.Data0=trainImage.data(find(trainLabel.data==0),:); %找到训练集所有为0的图片
trainImage.Data1=trainImage.data(find(trainLabel.data==1),:); %找到训练集所有为1的图片

trainImage.data0and1=trainImage.data(find(trainLabel.data==1 | trainLabel.data==0),:); %找到训练集中为0和1的图片
trainLabel.data0and1=trainLabel.data(find(trainLabel.data==1 | trainLabel.data==0),1);
testImage.data0and1=testImage.data(find(testLabel.data==1 | testLabel.data==0),:); %找到测试集中为0和1的图片
testLabel.data0and1=testLabel.data(find(testLabel.data==1 | testLabel.data==0),1);
%trainImage.data每一行代表一张图片
[r,c]=size(trainImage.data0and1);        %获取训练集
X_hat=[trainImage.data0and1./255 ones(r,1)];  %归一化，同时获取X的拓展矩阵  

%--训练---------------------------------------------------%
theta0=[ones(c,1)./c;0]; %设置优化问题初值
trainPara.lossMax = 1e-4; % 最大容许损失率
trainPara.iterMax = 1500; % 最大训练次数
trainPara.alpha = 0.1; % 学习率 
trainPara.errLimt=0.06;  %等步长到变步长的切换界限
trainPara.eta = 0.618; %迭代学习率变化率 

logisticModel=funLogisticTrain(@funcdCost,@funcCost,trainPara,theta0,X_hat,trainLabel.data0and1);

%----损失率曲线--------------------------------------%
figure;
xplot=(1:trainPara.iterMax);
plot(xplot,logisticModel.loss); 
%set(gcf,'unit','centimeters','position',[20 5 7 6]);
xlabel('numOfIter');
ylabel('Loss');
xlim([-200 1600]);
ylim([0 0.6]);


%--测试---------------------------------------------------%
[r_test,c_test]=size(testImage.data0and1);        %获取测试集参数
X_hat_test=[testImage.data0and1./255 ones(r_test,1)];  %归一化，同时得到拓展矩阵
y_Test=1./(1+exp(-logisticModel.theta(:,end)'*X_hat_test'));       %将测试集代入计算
y_Test(y_Test<0.5)=0;           %以0.5为界限二分
y_Test(y_Test>0.5)=1;
%--准确度计算---------------------------------------------------%
%将分类完成的测试y值与testLabel的数据进行对比
accuracy=length(find(y_Test'==testLabel.data0and1))/length(testLabel.data0and1);
disp(['测试集识别准确率为',num2str(accuracy*100),'%']);