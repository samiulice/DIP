clc;
clear all;
close all;

%% Log Transformation:
%Log transformation is a point processing technique used to expand the values of darker pixels 
%and compress the values of brighter pixels in an image. 
%This method is useful for enhancing the details in the darker areas of an image.

%% Read the grayscale image
img = imread('Image/Birds.jpg');
gray_img = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);  % Convert to grayscale if not already grayscale

% Convert the image to double for precision in log transformation
gray_img = double(gray_img);

% Step 1: Apply log transformation
% Calculate the scaling constant 'c' (max(gray_img(:)) gives the maximum pixel value)
c = 255 / log(1 + max(gray_img(:)));

% Apply the log transformation formula
log_transformed_img = c * log(1 + gray_img);

% Display the original and log transformed images
figure;
subplot(1, 2, 1);
imshow(uint8(gray_img)); title('Original Grayscale Image');
subplot(1, 2, 2);
imshow(uint8(log_transformed_img)); title('Log Transformed Image');
