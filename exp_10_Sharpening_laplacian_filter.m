% 10. Write a program to apply a Sharpening on an Image by laplacian filter.

close all ;
clear ;
clc ;

% Read input image
x = imread('Image/birds.jpg');

[rows, cols, n] = size(x);
img = zeros(rows, cols);
if n == 3
    img = 0.3*x(:,:,1)+0.59*x(:,:,2)+0.11*x(:,:,3);
else
    img = x;
end

% Define Laplacian filter kernel
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];

%% Padding
p = 1;
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

% Create output image
output_img = zeros(size(img));

% Apply Laplacian filter to each pixel in the image
for i = p+1:paddedRows-p
    for j = p+1:paddedCols-p
        % Extract local neighborhood around pixel
        local_neighborhood = padded_img(i-1:i+1, j-1:j+1);
        local_neighborhood = double(local_neighborhood) ;
        
        % Apply Laplacian filter to local neighborhood
        %filtered_pixel = sum(sum(local_neighborhood .* laplacian_kernel));
        filtered_pixel = 0;
        for x = 1:3
            temp = 0;
            for y = 1:3
                temp = temp + local_neighborhood(x,y)*laplacian_filter(x,y);
            end
            filtered_pixel = filtered_pixel + temp;
        end
        
        % Assign filtered pixel value to output image
        % Assign filtered pixel value to output image
        output_img(i-p,j-p) = img(i-p,j-p) + filtered_pixel;
    end
end

% Display original image and edge image side by side
subplot(1,2,1);
imshow(img);
title('Original Image');
subplot(1,2,2);
imshow(uint8(output_img));
title('Sharpened Image');
