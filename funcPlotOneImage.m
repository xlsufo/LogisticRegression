function [im] = funcPlotOneImage(inputData,rows,colums)
%根据输入绘制一幅图像，输入为行向量
imageMa=reshape(inputData,rows,colums)';%将向量映射为矩阵，转置以获得正确方向
imageMa2=255-imageMa;
figure,im=imshow(imageMa2,[0 255]); %
end

