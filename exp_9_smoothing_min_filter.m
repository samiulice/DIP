clc;
clear all;
close all;

%% Min Filter:
%replace the value of each pixel with the minimum value from its surrounding neighborhood.
%Effect: It darkens the image by making pixels take on the value of the darkest pixel in their neighborhood.
%Removing white noise: Effective in removing salt noise (white spots) from an image because it eliminates the bright pixels.

%% Read Original Image
img =imread('Image/birds.jpg');
[rows,cols, n] = size(img); %Get the dimension of the image

%% RGB to Gray Scale Conversion
if n == 3
    img = uint8( 0.3*img(:,:,1) + 0.59*img(:,:,2) + 0.11*img(:,:,3) );
end

%% Adding salt & pepper Noise
noise_img = imnoise(img,'salt & pepper',0.1);
only_salt_noise = noise_img;
only_salt_noise(noise_img == 0) = img(noise_img == 0);

%Define Filter
filter_size = 3;
p = floor(filter_size/2);
%% Padding
% Initialize the padded image with zeros
padded_img = zeros(rows+p*2, cols+p*2);

padded_img(p+1:end-p, p+1:end-p) = only_salt_noise(:, :);

padded_img(1:p, p+1:end-p) = only_salt_noise(1:p,:);
padded_img(p+1:end-p, 1:p) = only_salt_noise(:,1:p); 
padded_img(end-p:end, p+1:end-p) = only_salt_noise(end-p:end, :);
padded_img(p+1:end-p,end-p:end) = only_salt_noise(:,end-p:end);

padded_img(1:p,1:p) = only_salt_noise(1:p,1:p);
padded_img(1:p, end-p:end) = only_salt_noise(1:p, end-p:end);
padded_img(end-p:end, 1:p) = only_salt_noise(end-p:end,1:p);
padded_img(end-p:end, end-p:end) = only_salt_noise(end-p:end,end-p:end);

paddedRows = rows+2*p;
paddedCols = cols+2*p;

%% Using Min Filter
min_img = only_salt_noise;
for i = p+1:paddedRows-p
    for j = p+1:paddedCols-p
        neighborhood = padded_img(i-p:i+p, j-p:j+p);
        intensity = neighborhood(1, 1);
        for x = 1:filter_size
            for y = 1:filter_size
                if intensity > neighborhood(x, y)
                    intensity = neighborhood(x, y);
                end
            end
        end
        min_img(i-p,j-p)=intensity;  
    end
end

figure(1)
imshow(uint8(only_salt_noise))
title('Noisy image: Pepper Noise')
figure(2)
imshow(uint8(min_img))
title('After Applying Min Filter')


