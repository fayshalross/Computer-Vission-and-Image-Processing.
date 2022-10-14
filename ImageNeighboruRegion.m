clear, close all; 


% Reading an image 
im = imread('blurredImage02.jpg');
figure(1); imshow(im);
title('Import image');
 [r, c, set] = size(im);

% Initialize storage for each sample region 
storage = {'red', 'black', 'blue', 'yellow', 'green', 'background'};
nStorage = length(storage);
sample_regions = false([r c nStorage]);

% Select each sample region
f = figure;
for count = 1:nStorage
    set(f, 'name', ['select sample region for' storage{count}]);
    sample_regions(:, :, count) = roipoly(im);
end 
close(f);

% Display sample regions
for count = 1:nStorage
    figure (3);
    imshow(sample_regions(:,:,count))
    title(['Sample region for', classes{count}]);
end