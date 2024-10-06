clc;
clear all;
close all;

%% Gamma Correction:
% Gamma Correctionis a non-linear operation used to adjust the brightness of an image.
% It’s commonly used to correct the luminance of images for display on screens,
% as human perception of brightness is non-linear.

% Read the grayscale image
img = imread('Image/Birds.jpg');
gray_img = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);  % Convert to grayscale if not already grayscale

% Convert the image to double and normalize to the range [0, 1]
gray_img = double(gray_img) / 255;
%Define C (c is a scaling factor that can adjust the overall intensity of the output image)
c = 1;
% Define the gamma value (choose less than 1 for brightening, greater than 1 for darkening)
gamma = 2;  % Example: Gamma < 1 brightens the image, Gamma > 1 darkens the image

% Apply gamma correction
gamma_corrected_img = c*gray_img .^ gamma;  % Element-wise exponentiation

% Rescale to [0, 255] and convert back to uint8
gamma_corrected_img = uint8(gamma_corrected_img * 255);

% Display the original and gamma corrected images
figure;
subplot(1, 2, 1);
imshow(uint8(gray_img * 255)); title('Original Grayscale Image');
subplot(1, 2, 2);
imshow(gamma_corrected_img); title(['Gamma Corrected Image (Gamma = ', num2str(gamma), ')']);
