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


% Threshholding 
imA = im1 > 150; 
imA=~imA;
figure; 
imshow(imA);
imA=double(imA);
for (i=1: 3)
    im(:,:,i)=uint8(double(im(:,:,i)).*imA);
end
% im(:,:,3)=uint8(imA);


figure; 
imshow(im);
