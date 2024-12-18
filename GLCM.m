
imageDir = 'D:\hcue_MMD';
imageFiles = dir(fullfile(imageDir, '*.png'));
outputDir = 'D:\glcm\hcue_MMD'; 

allGLCMFeatures = [];

offsets = [0 1; -1 1; -1 0; -1 -1];
numLevels = 8;
symmetric = true;

for i = 1:length(imageFiles)
    
    filename = fullfile(imageDir, imageFiles(i).name);
    img = imread(filename);
    
    %  Convert to grayscale image
    grayImg = rgb2gray(img);
    
    % compute GLCM
    glcm = graycomatrix(grayImg, 'Offset', offsets, 'NumLevels', numLevels, 'Symmetric', symmetric);
    
    stats = graycoprops(glcm, {'contrast', 'correlation', 'energy', 'homogeneity'});
   
    allGLCMFeatures = [allGLCMFeatures; stats.Contrast, stats.Correlation, stats.Energy, stats.Homogeneity];
    
    [~, baseFileName, ~] = fileparts(filename);
    outputFilename = fullfile(outputDir, [baseFileName, '_glcm.mat']);
    save(outputFilename, 'stats'); 
end
