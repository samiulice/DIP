clc;
clear all;
close all;

img = imread('Image/Birds.jpg');
figure(1)
imshow(img)
I = im2double(img);
logimg = log(1+I);
figure(2)
imshow(logimg)