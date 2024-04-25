clc;
close all;
clear all;

%% Original Image
img = imread('Image/Birds.jpg');

figure('name','Image Conversion: RGB To Gray Scale')
subplot(1,2,1)
imshow(img)
title('Original image')


%% Image Conversion: RGB To Gray Scale
gray = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);
subplot(1,2,2)
imshow(gray)
title('Gray level image')