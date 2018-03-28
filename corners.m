clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
%==========================================================================%
%% Import the background images and the foreground image
bg1=imread('background1.png');
bg2=imread('background2.png');
bg3=imread('background3.png');
bg4=imread('background4.png');
fg1=imread('foreground1.png');
%% Combine the background images and extract a mean 
bg = imlincomb(0.25,bg1,0.25,bg2,0.25,bg3,0.25,bg4);
%bg=rgb2gray(bg);
%fg1=rgb2gray(fg1);
I0=imsubtract(fg1,bg);
I1=imabsdiff(fg1,bg);
subplot(2,2,1)
imshow(I0)
subplot(2,2,2)
imshow(I1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I2=rgb2gray(I0);
subplot(2,2,3)
imshow(I2)
I3=rgb2gray(I1);
subplot(2,2,4)
imshow(I3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
level = graythresh(I3);
bw1=im2bw(I3,level);
imshow(bw1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%bw2=edge(bw1, 'Canny');
%bw3=edge(bw1, 'Prewitt');


C = corner(bw1);
imshow(bw1);
hold on
plot(C(:,1), C(:,2), 'r*');



