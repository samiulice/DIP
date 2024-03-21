clc;
clear all;
close all;

%%Read image
img = imread('Image/Birds.jpg');
%I = imresize(img, [10,10]);
I = img;

%% Convert to gray level image
gimg = 0.3 * I(:,:,1) + 0.59 * I(:,:,2) + 0.11 * I(:,:,3);
figure(1)
imshow(gimg)
m = size(gimg, 1);
n = size(gimg, 2);
bits = 8;
plane = zeros(m, n, bits);

for i = 1 : m
    for j = 1 : n
        b = dec2bin(gimg(i, j), bits);
        disp(b)
        for k = 1 : bits
            plane(i,j,k) = uint8(b(1,k)-48);
        end
    end
end

for i = 1 : bits
    figure(i+1)
    imshow(plane(:,:,i))
end

