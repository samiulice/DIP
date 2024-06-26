clc;
clear all;
close all;

%% Read image
original_image = imread('Image/Birds.jpg');
figure(1)
imshow(original_image)
title('Original Image')

%% 8-bit plane slicing of the image
img = double(original_image);
bits = 8;
for i = 1 : bits
  b = mod(img, 2);
  img = floor(img/2); 
  figure(i+1)
  imshow(b)
  title(sprintf('Bit Plane: %g', i))
end

