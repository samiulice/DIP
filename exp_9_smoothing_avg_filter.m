clc;
clear all;
close all;
%% Smoothing an image refers to the process of reducing noise 
% and removing fine details or high-frequency components

%% Median Filter:
 %replaces each pixel's value with the median value of its surrounding neighborhood.
 %removes Salt-and-pepper noise while preserving edges
 
 %% Average (Mean) Filter:
 %replaces the pixel value with the average value of its surrounding neighborhood.
 %It smooths the image by averaging out variations, but it can blur edges.
 %It can help reduce Gaussian noise and smooth random pixel variations.
%Useful for applications where texture smoothing or reducing detail is needed.

%% Read Original Image
img =imread('Image/birds.jpg');
[rows,cols, n] = size(img); %Get the dimension of the image

%% RGB to Gray Scale Conversion
if n == 3
    img = uint8( 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3) );
end

%% Adding salt & pepper Noise
noise_img = imnoise(img,'salt & pepper',0.01);

%Define Filter
filter_size = 3;
p = floor(filter_size/2);
%% Padding
% Initialize the padded image with zeros
    padded_img = zeros(rows+p*2, cols+p*2);
    
    % Copy the original image to the center of the padded image
    padded_img(p+1:end-p, p+1:end-p) = noise_img;
       
    for x = 1:p
        padded_img(x, p+1:end-p) = noise_img(1, :); %Top rows
        padded_img(p+1:end-p, x) = noise_img(:,1); % Left columns
        padded_img(end-p+x, p+1:end-p) = noise_img(end, :); % Bottom rows
        padded_img(p+1:end-p, end-p+x) = noise_img(:,end); % Right columns
    end    
    % Pad the corners
    padded_img(1:p, 1:p) = noise_img(1,1);  % Top-left corner
    padded_img(1:p, end-p+1:end) = noise_img(1,end);  % Top-right corner
    padded_img(end-p+1:end, 1:p) = noise_img(end,1);  % Bottom-left corner
    padded_img(end-p+1:end, end-p+1:end) = noise_img(end,end);  % Bottom-right corner

%% Using Average Filter
avg_img = noise_img;
for i=1:rows
    for j=1:cols
        intensity = 0;
         for x = i:i+2*p
            for y = j:j+2*p
                intensity = intensity + double(padded_img(x, y));
            end
        end
        avg = intensity/filter_size^2;
        avg_img(i,j)=avg;  
    end
end
%% Using Median Filter
median_img = noise_img;
for i=1:rows
    for j=1:cols
        temp = padded_img(i:i+2*p, j:j+2*p);
        neighborhood = temp(:);
        for x = 1:(filter_size^2)-1
            id = x;
            for y = x+1:(filter_size^2)
                if neighborhood(id,1) < neighborhood(y,1)
                    id = y;
                end
            end
            temp = neighborhood(id,1);
            neighborhood(id,1) =  neighborhood(x,1);
             neighborhood(y,1) = neighborhood(id,1);
        end
        median_img(i,j)=neighborhood(ceil((filter_size^2)/2),1);  
    end
end


figure(1)
imshow(img)
title('Original image')
figure(2)
imshow(noise_img)
title('Noisy image')
figure(3)
imshow(uint8(avg_img))
title('After Applying Average Filter')
figure(4)
imshow(uint8(median_img))
title('After Applying Median Filter')