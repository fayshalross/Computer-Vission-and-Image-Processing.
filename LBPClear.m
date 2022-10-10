clc;clear;
close all; 
[fname path]=uigetfile('*.*', 'Enter an image');
fname=strcat(path,fname);
im=imread(fname);
% resizing images 
im=imresize(im, [256 256]);
imshow(im);


% Converting into gray scale 
im1=rgb2gray(im);
figure

% Implementing histogram 
subplot(2,1,1)
imshow(im1);
subplot(2,1,2);
imhist(im1)


% Thresholding 
imA=im1>150
figure; 
imshow(imA);
imA=uint8(double(imA) *255);
im(:,:,3)=imA; 

figure;
imshow(im);