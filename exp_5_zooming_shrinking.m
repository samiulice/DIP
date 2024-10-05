%% Matlab Program for Zooming Image
clc;
close all;
clear all;
%% Read Original Image
img = imread('Image/Birds.jpg');
figure(1)
imshow(img)
title('Original Image')

%% Zooming Factor
%zooming: z > 1
%shrinking : z < 1 
z = 2;

%% Dimension of the image
[width, height, p] = size(img);
new_width = floor(width*z);
new_height = floor(height*z);
%% Pixel Replication of the image
for i = 1:new_width
    for j = 1:new_height
        new_img(i, j, :) = img(ceil(i/z), ceil(j/z), :);
    end
end
figure(2)
imshow(new_img)
title(sprintf('Zooming factor %g', z))