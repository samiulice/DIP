clc;
close all;
clear all;
img1 = imread('Image/Forest.jpg');
img2 = imread('Image/Birds.jpg');
%% Show original Image
figure('name','Original Image')
subplot(1,2,1)
imshow(img1)
title('Forest')
subplot(1,2,2)
imshow(img2)
title('Birds')

%% Image Resize
I1 = imresize(img1,[320,320]);
I2 = imresize(img2,[320,320]);

%% Addition--Subtraction
figure('name','Addition--Subtraction')
subplot(1,3,1)
imshow(I1+I2);
title('Forest.jpg plus Birds.jpg')
subplot(1,3,2)
imshow(I1-I2)
title('Forest.jpg minus Birds.jpg ')
subplot(1,3,3)
imshow(I2-I1)
title('Birds.jpg minus Forest.jpg')

%% Show Negative Image
figure('name','Negative Image')
subplot(1,2,1)
neg1 = 255-img1;
imshow(neg1)
title('Negative Image of Forest.jpg')
subplot(1,2,2)
neg2 = 255-img2;
imshow(neg2)
title('Negative Image of Birds.jpg')

%% Image Conversion: RGB To Gray Scale
figure('name','Image Conversion: RGB To Gray Scale')
subplot(1,2,1)
gimg1 = 0.3 * img1(:,:,1) + 0.59 * img1(:,:,2) + 0.11 * img1(:,:,3);
imshow(gimg1)
title('Forest.jpg')
subplot(1,2,2)
gimg2 = 0.3 * img2(:,:,1) + 0.59 * img2(:,:,2) + 0.11 * img2(:,:,3);
imshow(gimg2)
title('Birds.jpg')

%% Histogram of Gray Scale Image
gcount = zeros(1, 256);
X = 0:255;
for i = 1:size(gimg1,1)
    for j = 1 : size(gimg1, 2)
        gcount(1,gimg1(i,j)+1) = gcount(1,gimg1(i,j)+1) + 1; 
    end
end
figure('name','Histogram of Gray Scale Image')
stem(X,gcount);
title('Histogram of Forest.jpg');
xlabel('Intensity')
ylabel('Frequency')
disp('Grayscale value:');
disp(gcount);

%% Image Conversion: Gray Scale To Monochrome 
mcount = zeros(1,256);
mimg = gimg1;
for i = 1:size(gimg1,1)
    for j = 1 : size(gimg1, 2)
        if gimg1(i,j) < 128
            mimg(i,j) = 0;
            mcount(1,1) = mcount(1,1) + 1;
        else
            mimg(i,j) = 255;
            mcount(1,256) = mcount(1,256) + 1;
        end
    end
end

figure('name', 'Image Conversion: Gray Scale To Monochrome ')
imshow(mimg);
title('Monochrome Image: Forest.jpg');
%% Histogram of Monochrome Image
figure('name', 'Histogram of Monochrome Image')
stem(X,mcount);
title('Histogram of Forest.jpg');
xlabel('Intensity')
ylabel('Frequency')
disp('Monochrome Valeues:');
disp(mcount);


