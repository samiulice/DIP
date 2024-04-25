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
% z > 1 for zooming and z < 1 shrink
z = 2;
%% Dimension of the image
[width, height, p] = size(img);
new_width = ceil(width*z);
new_height = ceil(height*z);
%% Pixel Replication of the image
for i = 1:new_width
    for j = 1:new_height
        new_image(i, j, :) = img(ceil(i*width/new_width), ceil(j*width/new_width), :);
    end
end
figure(2)
imshow(new_image)
title('Zooming factor %d', z)