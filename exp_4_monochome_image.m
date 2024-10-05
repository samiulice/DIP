clc;
close all;
clear all;

%% Read Original Image
img = imread('Image/Birds.jpg');

%% Image Conversion: RGB to Gray
gray = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);

threshold = 128;
mono = gray > threshold;

%% Show Images
figure('name', 'Image Conversion: Gray Scale To Monochrome ')
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(mono);
title('Monochrome Image');
