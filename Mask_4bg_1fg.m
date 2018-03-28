
addpath('D:\Dropbox\MATLAB\Main');

%%Read the images

bg1=imread('background1.png');
bg2=imread('background2.png');
bg3=imread('background3.png');
bg4=imread('background4.png');
fg1=imread('foreground1.png');


closedBW=extract_silhouette_bg_sub (bg1,bg2,bg3,bg4,fg1);   %extract the background and return the silhouette

binaryImage = bwareafilt(closedBW, 20); %extract the biggest object from the binary image

mask = imfill(binaryImage, 'holes');    %fill holes in the binary image

maskedImage = bsxfun(@times, fg1, cast(mask, 'like', fg1)); % Mask the original image 

imshow(maskedImage);    % Display the image.


