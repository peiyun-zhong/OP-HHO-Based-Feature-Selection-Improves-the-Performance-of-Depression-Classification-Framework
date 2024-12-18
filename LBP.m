imageDir = 'D:\scue';
imageFiles = dir(fullfile(imageDir, '*.png'));
outputDir = 'D:\lbp\scue'; 

allLBPFeatures = [];

for i = 1:length(imageFiles)
  
    filename = fullfile(imageDir, imageFiles(i).name);
    img = imread(filename);
     %  Convert to grayscale image
    grayImg = rgb2gray(img);
    
    lbpFeatures = extractLBPFeatures(grayImg);
    
  
    [~, baseFileName, ~] = fileparts(filename);
    outputFilename = fullfile(outputDir, [baseFileName, '_lbp.mat']);
    save(outputFilename, 'lbpFeatures');
 
    allLBPFeatures = [allLBPFeatures; lbpFeatures];
end