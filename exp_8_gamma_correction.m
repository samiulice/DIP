clc;
clear all;
close all;

%% Original Image
I = imread('Image/img1.jpg');
img = im2double(I);

figure('name','original image')
imshow(img)
title('Original image')

%% log Transformation(gamma < 1)
c = 1;
gamma = 0.5;
logimg = c*img.^gamma;
figure('name','Effect of gamma correction(\gamma <1)')
imshow(logimg)
title(['\gamma = ', sprintf('%.2f', gamma)])

%% log Transformation(gamma > 1)
c = 1;
gamma = 1.5;
logimg = c*img.^gamma;
figure('name','Effect of gamma correction(\gamma > 1)')
imshow(logimg)
title(['\gamma = ', sprintf('%.2f', gamma)])