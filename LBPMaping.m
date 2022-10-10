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

r=regionprops(imA); % Area or maping
for(i=1:length(r))
    if((r(i).Area<1000) && (r(i).Area>500))
       rr=r(i).BoundingBox;
    end 
end 


imshow(im);
hold on; 
rectangle('Position', rr,'EdgeColor','g');
