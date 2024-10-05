clc;
clear all;
close all;

%% Max Filter:
%replaces each pixel with the maximum value from its surrounding neighborhood.
%Effect: It brightens the image by making pixels take on the value of the brightest pixel in their neighborhood.
% Effective for removing pepper noise (black spots) from an image because it eliminates the dark pixels.
%Useful for enhancing bright spots in images, such as stars in astronomical images or features in microscopic images.

%% Read Original Image
img =imread('Image/birds.jpg');
[rows,cols, n] = size(img); %Get the dimension of the image

%% RGB to Gray Scale Conversion
if n == 3
    img = uint8( 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3) );
end

%% Adding salt & pepper Noise
noise_img = imnoise(img,'salt & pepper',0.01);
only_pepper_noise = noise_img;
only_pepper_noise(noise_img == 255) = img(noise_img == 255);

%Define Filter
filter_size = 3;
p = floor(filter_size/2);
%% Padding
% Initialize the padded image with zeros
    padded_img = zeros(rows+p*2, cols+p*2);
    
    % Copy the original image to the center of the padded image
    padded_img(p+1:end-p, p+1:end-p) = only_pepper_noise;
       
    for x = 1:p
        padded_img(x, p+1:end-p) = only_pepper_noise(1, :); %Top rows
        padded_img(p+1:end-p, x) = only_pepper_noise(:,1); % Left columns
        padded_img(end-p+x, p+1:end-p) = only_pepper_noise(end, :); % Bottom rows
        padded_img(p+1:end-p, end-p+x) = only_pepper_noise(:,end); % Right columns
    end    
    % Pad the corners
    padded_img(1:p, 1:p) = only_pepper_noise(1,1);  % Top-left corner
    padded_img(1:p, end-p+1:end) = only_pepper_noise(1,end);  % Top-right corner
    padded_img(end-p+1:end, 1:p) = only_pepper_noise(end,1);  % Bottom-left corner
    padded_img(end-p+1:end, end-p+1:end) = only_pepper_noise(end,end);  % Bottom-right corner

%% Using Max Filter
max_img = only_pepper_noise;
for i=1:rows
    for j=1:cols
        intensity = 0;
        for x = i:i+2*p
            for y = j:j+2*p
                if intensity < padded_img(x, y)
                    intensity = padded_img(x, y);
                end
            end
        end
        max_img(i,j)=intensity;  
    end
end

figure(1)
imshow(img)
title('Original image')
figure(2)
imshow(uint8(only_pepper_noise))
title('Noisy image: Pepper Noise')
figure(3)
imshow(uint8(max_img))
title('After Applying Max Filter')


