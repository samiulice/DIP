clc;
close all;
clear all;
%% RGB To Gray Scale Image Conversion
mimg = imread('Image/birds.jpg');
figure('name','RGB to Grayscale Image')
img = double(mimg)/255.0;
gimg = (0.3 * img(:,:,1) + 0.59 *img(:,:,2) + 0.11 * img(:,:,3));
imshow(gimg)