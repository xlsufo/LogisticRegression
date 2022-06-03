function [accuracy] = funcSoftmaxTest(theta,numClasses,x,y)
%
%theta 训练完成的模型参数
%numClasses 分类数
%x 测试集图片
%y 测试集列表
[r,c]=size(x);
p_predict=zeros(numClasses,c);
y_predict=y.*0;
 %将测试集代入计算
for i=1:c              
    for k=1:numClasses
        a=sum(exp(theta(:,1:numClasses)'*x(:,i)));
        p_predict(k,i)=exp(theta(:,k)'*x(:,i))./a;
    end
end

[max_a,y_predict]=max(p_predict,[],1); %找到每列最大值所在位置
accuracy=length(find(y_predict'==y))/length(y);
end

