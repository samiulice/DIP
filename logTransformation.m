clc;
clear all;
close all;
%X = imread('Image/Birds.jpg');
%I = imresize(X, [10,10]);

I = imread('Image/Birds.jpg');

figure(1)
subplot(2,1,1)
img = im2double(I);
imshow(img)
title('Original Image')
logimg = log(1+img);
subplot(2,1,2)
imshow(logimg)
title('After log transform')