clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
%==========================================================================%
%% Import the background images and the foreground image

bg=imread('background.jpeg');
fg1=imread('original.jpeg');

%% Combine the background images and extract a mean 
Iabsdiff=imabsdiff(fg1,bg); %Gets the absolute subtractions of the images
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I1gray=rgb2gray(Iabsdiff);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
I1grayadj=imadjust(I1gray);     %Perform Histogram Stretching
level = graythresh(I1gray); %Calculate the global threshold of the image using Otsu's method     
bw1=im2bw(I1gray,level);    %Threshold the image using the threshold calculated above
imshow(bw1);


subplot(1,2,1);
imshow(fg1);
subplot(1,2,2);
imshow(bw1);

perimeter=bwperim(bw1);
imshow(perimeter);

se=strel('disk',25,8);
closedbw=imclose(bw1,se);
imshow(closedbw);

perimeter2=bwperim(closedbw);
imshow(perimeter2);