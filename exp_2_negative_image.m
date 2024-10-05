clc;
close all;
clear all;
%% Negative Image
img = imread('Image/Birds.jpg');
neg = 255-img;

%% Show Images
figure('name', 'Negetive of an image');
subplot(1,2,1)
imshow(img)
title('original')
subplot(1,2,2)
imshow(neg)
title('Negative Image')