clc;
clear all;
close all;

%%Read image
img = imread('Image/Birds.jpg');
%I = imresize(img, [10,10]);
I = img;

%% Convert to gray level image
% gimg = 0.3 * I(:,:,1) + 0.59 * I(:,:,2) + 0.11 * I(:,:,3);
gimg = img;
figure(1)
imshow(gimg)
[m, n, d] = size(gimg);
bits = 8;
plane = zeros(m, n, d, bits);

for i = 1 : m
    for j = 1 : n
        a = dec2bin(gimg(i, j, 1), bits);
        b = dec2bin(gimg(i, j, 2), bits);
        c = dec2bin(gimg(i, j, 3), bits);
        disp(b)
        for k = 1 : bits
            plane(i,j,1,k) = uint8(a(1,k)-48);
            plane(i,j,2,k) = uint8(b(1,k)-48);
            plane(i,j,3,k) = uint8(c(1,k)-48);
        end
    end
end

for i = 1 : bits
    figure(i+1)
    imshow(plane(:,:,:,i))
end

