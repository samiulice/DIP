%% Matlab Program for Zooming Image
clc;
close all;
clear all;
%% Read Original Image
I = imread('Image/Birds.jpg');

figure(1)
imshow(I)
title('Original Image')
%% Dimension of the image
img = I;
[m, n, p] = size(img);
%% Zooming Factor
z = 2;

%% Pixel Replication of the image
figure(2)
for i = 1:m
    for j = 1:n
        for k = 1:p
            for x = 1:z
                zoomImg((i-1)*z+x,(j-1)*z+x,k) = img(i,j,k);
            end
        end
    end
end

imshow(zoomImg)
title('Zoomed Image')

%% Shrinking Image
figure(3)
for i = 1:m
    for j = 1:n
        for k = 1:p
            for x = 1:z
                shrinkImg(i,j,k) = zoomImg((i-1)*z+x,(j-1)*z+x,k);
            end
        end
    end
end

imshow(shrinkImg)
title('Shrink Image')

