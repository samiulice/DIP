clc;
close all;
clear all;

%% Read Original Image
img = imread('Image/Birds.jpg');

%% Image Conversion: RGB to Gray
gray = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);
[m,n] = size(gray);
mono = zeros(m,n);
for i = 1:m
    for j = 1 : n
        if gray(i,j) > 127
            mono(i,j) = 255; %Monochrome Image
            %mono(i,j) = 1; %Binary Image
        end
    end
end

%% Show Images
figure('name', 'Image Conversion: Gray Scale To Monochrome ')
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(mono);
title('Monochrome Image');
