clc;
close all;
clear all;

%% Original Image
img = imread('Image/Birds.jpg');

figure('name','Image Conversion: RGB To Gray Scale')
imshow(img)
title('Original image')

%% Image Conversion: RGB To Gray Scale
gray = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);
figure('name', 'Gray Level Image')
imshow(gray)
title('Gray level image')

%% Histogram of Gray Scale Image
histogram = zeros(1, 256);
[rows,cols] = size(gray); 
for i = 1:rows
    for j = 1 : cols
        histogram(1,gray(i,j)+1) = histogram(1,gray(i,j)+1) + 1; 
    end
end
figure('name','Histogram of Gray Scale Image')
stem((0:255),histogram);
title('Histogram of Forest.jpg');
xlabel('Intensity')
ylabel('Frequency')
disp('Grayscale value:');
disp(histogram);

%% Histogram Equalization

% Compute cumulative distribution function
cdf = cumsum(histogram) / (rows * cols);

% Map grayscale values to new values using CDF
new_gray_img = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        new_gray_img(i,j) = round(255 * cdf(img(i,j)+1));
    end
end
figure('name','Histogram Equalization')
imshow(uint8(new_gray_img))

