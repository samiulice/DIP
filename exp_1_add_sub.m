clc;
close all;
clear all;

img1 = imread('Image/Forest.jpg');
img2 = imread('Image/Birds.jpg');
%% Show original Image
figure('name','Image Addition And Subtraction')
subplot(2,2,1)
imshow(img1)
title('Forest')
subplot(2,2,2)
imshow(img2)
title('Birds')

%% Resize images 
I1 = imresize(img1,[320,320]);
I2 = imresize(img2,[320,320]);

%% Addition--Subtraction
subplot(2,2,3)
imshow(I1+I2);
title('Forest.jpg + Birds.jpg')
subplot(2,2,4)
imshow(I1-I2)
title('Forest.jpg - Birds.jpg ')

