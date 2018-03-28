clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
%==========================================================================%
%% Import the background images and the foreground image
tic
bg1=imread('background1.png');
bg2=imread('background2.png');
bg3=imread('background3.png');
bg4=imread('background4.png');
fg1=imread('foreground1.png');

bgg1=rgb2gray(bg1);
bgg2=rgb2gray(bg2);
bgg3=rgb2gray(bg3);
bgg4=rgb2gray(bg4);
fgg1=rgb2gray(fg1);

%% Combine the background images and extract a mean 
bg = imlincomb(0.25,bgg1,0.25,bgg2,0.25,bgg3,0.25,bgg4);

Idiff=imsubtract(fgg1,bg);
Iabsdiff=imabsdiff(fgg1,bg);

subplot(2,2,1)
imshow(Idiff)
subplot(2,2,2)
imshow(Iabsdiff)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%I2=rgb2gray(Idiff);
I2=Idiff;

subplot(2,2,3)
imshow(I2)
%I1gray=rgb2gray(Iabsdiff);
I1gray=Iabsdiff;
subplot(2,2,4)
imshow(I1gray)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
I1gray=imadjust(I1gray);
I1gray = wiener2(I1gray,[60,60]);
imshow(I1gray);
level = graythresh(I1gray);
bw1=im2bw(I1gray,level);
se = strel('disk',10);
closeBW = imclose(bw1,se);
figure, imshow(closeBW)

%%imwrite(closeBW,'closedbw.png');
perim=bwperim(closeBW);
figure, imshow(perim)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
toc