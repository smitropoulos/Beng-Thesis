clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
%==========================================================================%
%% Import the background images and the foreground image
bw1=imread('imbw.png');

se = strel('disk',25,8); %Disk Structure Elemend with r=25

closeBW = imclose(bw1,se); %Use the morphological operator to fill the silhouette

figure, imshow(closeBW)

contour=imcontour(closeBW);

pcolor(x, y, z); % Plot the data
hold on;
shading flat
[cc, hh] = contour(x, y, z, [0 10^5], 'k'); % Overlay contour line
hold on;
cc(cc<1) = NaN;
h = plot(cc(1,:), cc(2, :), 'w.');