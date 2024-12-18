function [pqr,xx]=test_new(x)
A=[]
ppp=dec2bin(x)
len=length(ppp)
load('train','combinedFeatures')
for i=1:len
   if ppp(i)=="1"
      A=[A combinedFeatures(:,i)]
   end
end
A=[A combinedFeatures(:,76)]
ratio=0.1;%The proportion of the test data.
[N,M]=size(A);
K=4;
trainData=combinedFeatures(:,1:75);
trainClass=combinedFeatures(:,76);
num_test=N*ratio;
%newData=(oldData-minValue)/(maxValue-minValue);
minValue=min(trainData);
maxValue=max(trainData);
trainData=(trainData-repmat(minValue,N,1))./(repmat(maxValue-minValue,N,1));
error=0;
for i=1:num_test
    idx=KNN(trainData(num_test+1:N,:),trainClass(num_test+1:N,:),trainData(i,:),K);
    fprintf('The test data belongs to the class：%d\n',trainClass(i,:));
    if idx~=trainClass(i,:);
        error=error+1;
    end
end
pqr=1-error/num_test;
xx=x;
end
