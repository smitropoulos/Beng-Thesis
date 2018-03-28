clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
%==========================================================================%
%% Import the background images and the foreground image
bw1=imread('imbw.png');

se = strel('disk',25,8);

closeBW = imclose(bw1,se);
figure, imshow(closeBW)

%%imwrite(closeBW,'closedbw.png');
perim=bwperim(closeBW);
figure, imshow(perim)
