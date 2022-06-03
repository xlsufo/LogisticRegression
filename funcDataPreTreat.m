function [dataStruct] = funcDataPreTreat(dataType,inPath,savePath)
%数据前处理函数

switch dataType 
    case 'trainImage'
        %--训练集Image处理---------------------------------------%
        fileID = fopen(inPath,'r','b');  %只读形式打开文件，大端排序方式，避免读取问题
        trainImage.magicNumber=fread(fileID,1,'ubit32'); %按源文件定义读取数据
        trainImage.number=fread(fileID,1,'ubit32');
        trainImage.rows=fread(fileID,1,'ubit32');
        trainImage.colums=fread(fileID,1,'ubit32');
        trainImage.data = zeros(trainImage.number,trainImage.rows*trainImage.colums);
        for i = 1:trainImage.number
                    trainImage.data(i,:) = fread(fileID,(trainImage.rows*trainImage.colums), 'uchar');
        end
        fclose(fileID);  %关闭文件
        save(savePath,'trainImage'); %保存数据
        dataStruct=trainImage;
        
    case 'trainLabel'
        %--训练集Label处理---------------------------------------%
        fileID = fopen(inPath,'r','b');  %只读形式打开文件，大端排序方式，避免读取问题
        trainLabel.magicNumber=fread(fileID,1,'ubit32'); %按源文件定义读取数据
        trainLabel.labelNumber=fread(fileID,1,'ubit32'); 
        trainLabel.data = fread(fileID,(trainLabel.labelNumber), 'uchar');
        fclose(fileID);  %关闭文件
        save(savePath,'trainLabel'); %保存数据
        dataStruct=trainLabel;
        
    case 'testImage'
        %--测试集Image处理---------------------------------------%
        fileID = fopen(inPath,'r','b');  %只读形式打开文件，大端排序方式，避免读取问题
        testImage.magicNumber=fread(fileID,1,'ubit32'); %按源文件定义读取数据
        testImage.number=fread(fileID,1,'ubit32');
        testImage.rows=fread(fileID,1,'ubit32');
        testImage.colums=fread(fileID,1,'ubit32');
        testImage.data = zeros(testImage.number,testImage.rows*testImage.colums);
        for i = 1:testImage.number
                    testImage.data(i,:) = fread(fileID,(testImage.rows*testImage.colums), 'uchar');
        end
        fclose(fileID);  %关闭文件
        save(savePath,'testImage'); %保存数据
        dataStruct=testImage;
        
    case 'testLabel'    
        %--测试集Label处理---------------------------------------%
        fileID = fopen(inPath,'r','b');  %只读形式打开文件，大端排序方式，避免读取问题
        testLabel.magicNumber=fread(fileID,1,'ubit32'); %按源文件定义读取数据
        testLabel.labelNumber=fread(fileID,1,'ubit32');
        testLabel.data = fread(fileID,(testLabel.labelNumber), 'uchar');
        fclose(fileID);  %关闭文件
        save(savePath,'testLabel'); %保存数据
        dataStruct=testLabel;
        
end


end

