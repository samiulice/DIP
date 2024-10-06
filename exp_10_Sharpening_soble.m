% 10. Write a program to detect Line/Edge/Boundary in an image by Sobel filter.
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

% Define Sobel filter kernels
sobel_kernel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_kernel_y = [-1 -2 -1; 0 0 0; 1 2 1];

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

% Create output image
output_img = zeros(size(img));

% Apply Prewitt filter to each pixel in the image
paddedRows = rows+2*p;
paddedCols = cols+2*p;
for i = p+1:paddedRows-p
    for j = p+1:paddedCols-p
        % Extract local neighborhood around pixel
        local_neighborhood = padded_img(i-1:i+1, j-1:j+1);
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
        output_img(i-p,j-p) = img(i-p,j-p) + gradient_magnitude;
    end
end

% Display original and sharpened images side by side
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(uint8(output_img));
title('Sharpened Image');