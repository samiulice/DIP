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
img =imread('cameraman.tif');
[rows,cols, n] = size(img); %Get the dimension of the image

%% RGB to Gray Scale Conversion
if n == 3
    img = uint8( 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3) );
end

%% Adding salt & pepper Noise
img = imnoise(img,'salt & pepper',0.01);

%Define Filter
filter_size = 3;
p = floor(filter_size/2);
%% Padding
% Initialize the padded image with zeros
padded_img = zeros(rows+p*2, cols+p*2);

padded_img(p+1:end-p, p+1:end-p) = img(:, :);

padded_img(1:p, p+1:end-p) = img(1:p,:);
padded_img(p+1:end-p, 1:p) = img(:,1:p); 
padded_img(end-p:end, p+1:end-p) = img(end-p:end, :);
padded_img(p+1:end-p,end-p:end) = img(:,end-p:end);

padded_img(1:p,1:p) = img(1:p,1:p);
padded_img(1:p, end-p:end) = img(1:p, end-p:end);
padded_img(end-p:end, 1:p) = img(end-p:end,1:p);
padded_img(end-p:end, end-p:end) = img(end-p:end,end-p:end);

paddedRows = rows+2*p;
paddedCols = cols+2*p;

%% Using Average Filter
avg_img = img;
for i = p+1:paddedRows-p
    for j = p+1:paddedCols-p
        neighborhood = padded_img(i-p:i+p, j-p:j+p);
        intensity = 0;
         for x = 1:filter_size
            for y = 1:filter_size
                intensity = intensity + neighborhood(x, y);
            end
        end
        avg = intensity/filter_size^2;
        avg_img(i-p,j-p)=avg;  
    end
end
%% Using Median Filter
median_img = zeros(rows, cols);
for i = p+1:paddedRows-p
    for j = p+1:paddedCols-p
        temp = padded_img(i-p:i+p, j-p:j+p);
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
             neighborhood(x,1) = temp;
        end
         median_img(i-p,j-p)=neighborhood(ceil((filter_size^2)/2),1);  
     end
end

figure(1)
imshow(img)
title('Noisy image')
figure(2)
imshow(uint8(avg_img))
title('After Applying Average Filter')
figure(3)
imshow(uint8(median_img))
title('After Applying Median Filter')