%----文件说明-----------------------------------%
%功能：对数据集和测试集数据进行前处理
%创建日期：20211005
%修改日期：20211005
%修改人：许立松
%-------------------------------------------%

clc;clear;

%--定义输入输出文件路径-----------------------------------------------%
trainImagePath = './OriginData/train-images-idx3-ubyte';  
trainLablePath = './OriginData/train-labels-idx1-ubyte';
testImagePath = './OriginData/t10k-images-idx3-ubyte';
testLablePath = './OriginData/t10k-labels-idx1-ubyte';

trainImgSavePath= './PreTreatedData/trainImages.mat';
trainLbeSavePath = './PreTreatedData/trainLabels.mat';
testImgSavePath= './PreTreatedData/testImages.mat';
testLbeSavePath = './PreTreatedData/testLabels.mat';

%--调用数据前处理函数--------------------------------%
trainImage=funcDataPreTreat('trainImage',trainImagePath,trainImgSavePath);
trainLabel=funcDataPreTreat('trainLabel',trainLablePath,trainLbeSavePath);
testImage=funcDataPreTreat('testImage',testImagePath,testImgSavePath);
testLabel=funcDataPreTreat('testLabel',testLablePath,testLbeSavePath);

funcPlotOneImage(trainImage.data(29,:),trainImage.rows,trainImage.colums);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
