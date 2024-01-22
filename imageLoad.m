clc;
close all;
clear all;
%%img = imread('/Image/img1.jpg');
img = imread('/Image/birds.jpg');
whos img
%% Show original Image
figure(1)
subplot(2,1,1)
imshow(img)
title('Original Image')
%% Show Negative Image
subplot(2,1,2)
L = 2^8;
neg = (L-1)-img;
imshow(neg)
title('Negative Image')

%% Gray Scale Image
figure(2)
gimg = rgb2gray(img);
whos gimg
imshow(gimg)
title('Gray Scale Image')
%% Histogram of Gray Scale Image
figure(3)
gcount = zeros(1, 256);
X = 0:255;
for i = 1:size(gimg,1)
    for j = 1 : size(gimg, 2)
        gcount(1,gimg(i,j)+1) = gcount(1,gimg(i,j)+1) + 1; 
    end
end
stem(X,gcount);
title('Histogram of Gray Scale Image');
disp('Grayscale value:');
disp(gcount);

%% Monochrome Image
mcount = zeros(1,256);
mimg = gimg;
for i = 1:size(gimg,1)
    for j = 1 : size(gimg, 2)
        if gimg(i,j) < 128
            mimg(i,j) = 0;
            mcount(1,1) = mcount(1,1) + 1;
        else
            mimg(i,j) = 255;
            mcount(1,256) = mcount(1,256) + 1;
        end
    end
end
%%Show Monochrome Image
figure(4)
imshow(mimg);
title('Monochrome Image');
%%Histogram of Monochrome Image
figure(5)
stem(X,mcount);
title('Histogram of Monochrome Image');
disp('Monochrome Valeues:');
disp(mcount);

