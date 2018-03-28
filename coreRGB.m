clc;    % Clear the command window.
close all;  % Close all figures. 
clear;  % Erase all existing variables.
%==========================================================================%
%% Import the background images and the foreground image

bg1=imread('background1.png');
bg2=imread('background2.png');
bg3=imread('background3.png');
bg4=imread('background4.png');
fg1=imread('foreground1.png');

%% Combine the background images and extract a mean 
bg = imlincomb(0.25,bg1,0.25,bg2,0.25,bg3,0.25,bg4);

Idiff=imsubtract(fg1,bg);   %Subtracts one image from the other
Iabsdiff=imabsdiff(fg1,bg); %Gets the absolute subtractions of the images

subplot(2,2,1)
imshow(Idiff)
subplot(2,2,2)
imshow(Iabsdiff)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
I2=rgb2gray(Idiff); %Convert I2 to grayscale
subplot(2,2,3)
imshow(I2)

I1gray=rgb2gray(Iabsdiff);
subplot(2,2,4)
imshow(I1gray)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
I1grayadj=imadjust(I1gray);     %Perform Histogram Stretching
I1grayfiltered = wiener2(I1grayadj,[60,60]);    %Apply a Wiener filter in 60 by 60 neighbourhoods
imshow(I1grayfiltered); %Show the result of the wiener filter
level = graythresh(I1grayfiltered); %Calculate the global threshold of the image using Otsu's method     
bw1=im2bw(I1grayfiltered,level);    %Threshold the image using the threshold calculated above

se = strel('disk',25,8);  %Disk Structure Elemend with r=25

closeBW = imclose(bw1,se); %Use the morphological operator to fill the silhouette
figure, imshow(closeBW)

perim=bwperim(closeBW); %Extract the silhouette's contour
figure, imshow(perim)
