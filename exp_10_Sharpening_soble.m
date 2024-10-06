% 10. Write a program to detect Line/Edge/Boundary in an image by Sobel filter.
close all ;
clear ;
clc ;

% Read input image
x = imread('cameraman.tif');
[rows, cols, n] = size(x);
img = zeros(rows, cols);
if n == 3
    img = 0.3*x(:,:,1)+0.59*x(:,:,2)+0.11*x(:,:,3);
else
    img = x;
end 

% Define Sobel filter kernels
sobel_kernel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_kernel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Add padding to the input image
p = 1;
padded_img = zeros(rows+2*p, cols+2*p);

%Copy original image to the center of the padded image
padded_img(p+1:end-p,p+1:end-p) = img(:,:);
%Replicate border pixels
for x = 1:p
    padded_img(x, p+1:end-p) = img(1,:); %Top row
    padded_img(p+1:end-p, x) = img(:,1); %Left column
    padded_img(end-p+x:end, p+1:end-p) = img(end,:); %Bottom row
    padded_img(p+1:end-p, end-p+x:end) = img(:,end);%Right column
end
padded_img(1:p, 1:p) = img(1,1);
padded_img(1:p, end-p+1:end) = img(1,end);
padded_img(end-p+1:end, 1:p) = img(end,1);
padded_img(end-p+1:end, end-p+1:end) = img(end,end);
% Create output image

% Create output image
output_img = zeros(size(img));

% Apply Prewitt filter to each pixel in the image
for i = 1:rows
    for j = 1:cols
        % Extract local neighborhood around pixel
        local_neighborhood = padded_img(i:i+2, j:j+2);
        local_neighborhood = double(local_neighborhood) ;
        
        % Apply Prewitt filters to local neighborhood in x and y directions
        
        filtered_pixel_x = 0.0;
        for x = 1:3
            temp = 0;
            for y = 1:3
                temp = temp + local_neighborhood(x,y)*sobel_kernel_x(x,y);
            end
            filtered_pixel_x = filtered_pixel_x + temp;
        end
        
        filtered_pixel_y = 0.0;
        for x = 1:3
            temp = 0;
            for y = 1:3
                temp = temp + local_neighborhood(x,y)*sobel_kernel_y(x,y);
            end
            filtered_pixel_y = filtered_pixel_y + temp;
        end
        
        % Compute gradient magnitude at pixel
        gradient_magnitude = sqrt(filtered_pixel_x^2 + filtered_pixel_y^2);
        
        % Assign gradient magnitude to output image
        output_img(i,j) = img(i,j) + gradient_magnitude;
    end
end

% Display original and sharpened images side by side
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(uint8(output_img));
title('Sharpened Image');