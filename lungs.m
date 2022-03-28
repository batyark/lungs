clc;
clear;
tu_original=imread('lung.jpg');
figure(1);
subplot(131)
tu_gray=rgb2gray(tu_original);
imshow(tu_gray);title('original image gray scale')

subplot(132)
%Remove Thin Lines Using Erosion
SE = strel("disk",2)
BW2 = imerode(tu_gray,SE);
imshow(BW2);title('Remove Thin Lines Using Erosion')
subplot(133)
%Median filter is the best-known example, which as its name implies,
%replaces the value of a pixel by the median of the gray levels in the neighborhood of that pixel
J = medfilt2(BW2);
imshow(J);title('meian filter')

figure(4); %Otsu Thresholding 
[counts,x] = imhist(J,50);
stem(x,counts);
T = otsuthresh(counts);
BW = imbinarize(J,T);
figure(5);
imshow(BW)
figure(6);
BW2 = bwareaopen(BW, 90);
imshowpair(BW,BW2,'montage')

figure(7);
tu=BW-BW2;%Image Subtraction
imshow(tu)