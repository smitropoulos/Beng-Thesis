clc
clear all

BW = imread('blobs.png');
imshow(BW,[]);
r = 163;
c = 37;
B = bwboundaries(BW,'noholes');
contour = bwtraceboundary(BW,[r c],'s',8,Inf,'counterclockwise');
hold on;
plot(contour(:,2),contour(:,1),'g','LineWidth',2);

