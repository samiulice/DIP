clc;
clear all;
close all;

%%Read image
img = double(imread('Image/Birds.jpg'));
bits = 8;
for i = 1 : bits
  b = mod(img, 2);
  img = img/2;
  figure(i)
  imshow(b); 
end


