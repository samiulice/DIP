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
bit_planes = cell(1, 8);
for i = 1 : bits
  bit_planes{i} = img - 2 * floor(img / 2);
  img = floor(img/2); 
  figure(i+1)
  imshow(bit_planes{i})
  title(sprintf('Bit Plane: %g', i))
end

% % Reconstruction of original Image
% Initialize the reconstructed image as zeros (same size as original)
reconstructed_img = zeros(size(img));

% Combine all the bit planes to reconstruct the original image
for i = 1:8
    reconstructed_img = reconstructed_img + bit_planes{i} * 2^(i-1);
end

% Display the reconstructed image
figure;
imshow(uint8(reconstructed_img));
title('Reconstructed Image');



