function [ idx ] = KNN( trainData,trainClass,testData,K )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[N,M]=size(trainData);
%Calculate the Euclidean distance ( \text{dist} ) between the training dataset and the test data.
dist=zeros(N,1);
for i=1:N
    dist(i,:)=norm(trainData(i,:)-testData);
end
%Sort dist in ascending order; 
[Y,I]=sort(dist,1);   
K=min(K,length(Y));
%Correspond the classes of the training data with the sorted results of the training data; 
labels=trainClass(I);
%{
% Determine the frequency of occurrence of the classes of the top K points
classNum=length(unique(trainClass));% Get the number of unique elements in the set; 
labels=zeros(1,classNum);
for i=1:K
    j=trainClass(i);
    labels(j)=labels(j)+1;
end
%Return the class with the highest frequency among the top K points as the predicted class for the test data
[~,idx]=max(labels);
%}
%Determine the frequency of occurrence of the classes of the top K points
idx=mode(labels(1:K));%The mode function calculates the mode
fprintf('The test data belongs to the class %d  ',idx);
