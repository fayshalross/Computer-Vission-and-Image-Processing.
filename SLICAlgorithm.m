clear, close all; 

addpath(genpath('data'));


% Reading an image into the work place 
A = imread('Azalea-Bloom-Times-and-Flowering-Groups-Cover.jpg');
imshow(A); title('Input image');
figure(1);

% Calculating superpixels of the image 
[L, N] = superpixels(A,500);

% Display the superpixel boundaries overlaid on the origninal image 
figure(2);
BW = boundarymask(L);
imshow(imoverlay(A, BW, 'cyan'), 'InitialMagnification', 67);


% Set the color of each pixels in the output image to the mean RGB color of
% the superpixel region. 
outputImage = zeros(size(A),'like',A);
idx = label2idx(L);
numRows = size(A,1);
numCols = size(A,2);
for labelVal = 1:N
    redIdx = idx{labelVal};
    greenIdx = idx{labelVal}+numRows*numCols;
    blueIdx = idx{labelVal}+2*numRows*numCols;
    outputImage(redIdx) = mean(A(redIdx));
    outputImage(greenIdx) = mean(A(greenIdx));
    outputImage(blueIdx) = mean(A(blueIdx));
end    

figure
imshow(outputImage,'InitialMagnification',67)


