clc;
clear all;
close all;

%% Original Image
I = imread('Image/Forest_1.jpg');
img = im2double(I);

figure('name','Image Conversion: RGB To Gray Scale')
subplot(1,2,1)
imshow(img)
title('Original image')

%% log Transformation
c = 2;
s = c*log(1+img);
subplot(1,2,2)
imshow(s)
title('Effect of log transformation')