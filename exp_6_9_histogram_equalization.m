clc;
close all;
clear all;

%% Original Image
img = imread('Image/Birds.jpg');

%% Image Conversion: RGB To Gray Scale
gray_img = 0.3 * img(:,:,1) + 0.59 * img(:,:,2) + 0.11 * img(:,:,3);

% Get the image dimensions
[rows, cols] = size(gray_img);

%% Histogram Equalization
% Step 1: Compute the histogram using a custom manual_imhist function
histogram = manual_imhist(gray_img);

% Step 2: Compute the CDF (Cumulative Distribution Function)
cdf = zeros(1, 256);
cdf(1) = histogram(1);
for k = 2:256
    cdf(k) = cdf(k - 1) + histogram(k);
end

% Step 3: Normalize the CDF
cdf = cdf / (rows * cols);  % Normalize the CDF

% Step 4: Use the CDF to map pixel values to the new equalized values
equalized_img = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        equalized_img(i, j) = round(cdf(gray_img(i, j) + 1) * 255);  % Map pixel values
    end
end

% Convert the output image to uint8
equalized_img = uint8(equalized_img);

% Display the original and equalized images
figure;
subplot(1, 2, 1);
imshow(gray_img); title('Original Image');
subplot(1, 2, 2);
imshow(equalized_img); title('Equalized Image');

% Display the original and equalized histograms
figure;
subplot(1, 2, 1);
bar(0:255, histogram); title('Original Histogram');
subplot(1, 2, 2);
bar(0:255, manual_imhist(equalized_img)); title('Equalized Histogram');

%% Manual histogram function definition
function hist = manual_imhist(gray_img)
    % Initialize the histogram array (256 bins for intensity values 0-255)
    hist = zeros(1, 256);
    
    % Get the dimensions of the grayscale image
    [rows, cols] = size(gray_img);
    
    % Compute the histogram
    for i = 1:rows
        for j = 1:cols
            intensity = gray_img(i, j);   % Get the intensity of the pixel
            hist(intensity + 1) = hist(intensity + 1) + 1;  % Update the histogram
        end
    end
end

