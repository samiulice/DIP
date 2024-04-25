clc;
close all;
clear all;

img1 = imread('Image/Forest.jpg');
img2 = imread('Image/Birds.jpg');
%% Show original Image
figure('name','Original Image')
subplot(1,2,1)
imshow(img1)
title('Forest')
subplot(1,2,2)
imshow(img2)
title('Birds')

%% Resize images 
I1 = imresize(img1,[320,320]);
I2 = imresize(img2,[320,320]);

%% Addition--Subtraction
figure('name','Addition--Subtraction')
subplot(1,3,1)
imshow(I1+I2);
title('Forest.jpg + Birds.jpg')
subplot(1,3,2)
imshow(I1-I2)
title('Forest.jpg - Birds.jpg ')
subplot(1,3,3)
imshow(I2-I1)
title('Birds.jpg - Forest.jpg')

