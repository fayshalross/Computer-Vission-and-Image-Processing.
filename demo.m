clc;clear;
close all;
 

addpath(genpath('metrics'));
addpath(genpath('data'));


%% Reading input image directly from any folder 

[fname path]=uigetfile('*.*', 'Enter an image');
fname=strcat(path,fname);
subplot(2,2,1); % Ploting image
im = imread(fname);
imshow(im);

% Add a title
title('Input image')
%% Separate color chennel 
% DESCRIPTIVE TEXT
% blur_img =rgb2gray((img));


% Separate color chennel 
imR=im; % Takeing read image 
imR(:,:,2:3)=0; % Making blue and green as 0
subplot(2,2,2); % Ploting the images 
imshow(imR);
title('Read Image');


imG=im; % Taking blue image
imG(:,:,1:2:3)=0;   % Read and blue become 0
subplot(2,2,3);
imshow(imG);
title('Green Image')


imB=im; % Taking the green image
imB(:,:,1:2)=0; % Read and green components are 0
subplot(2,2,4);
imshow(imB);
title('Blue Image');
%% Selecting channels & making images gray scale
imR1=im(:,:,1); 
imG1=im(:,:,2);
imB1=im(:,:,3);

figure; 
subplot(2,2,1); 
imshow(imR1); 
title('Read section');

subplot(2,2,2); 
imshow(imG1); 
title('Green secton');

subplot(2,2,3); 
imshow(imB1); 
title('Blue section');
%% Transfering Read, Green, and Blue to Gray Image

imGray=rgb2gray(im); 
subplot(2,2,4);
imshow(imGray); 
title('Gray image');
%% Using formula for gray conversion 
imGray2=uint8(0.299*double(imR1)+0.587*double(imG1)+0.114*double(imB1));
figure; 
imshow(imGray2);
title('Gray using formula');

