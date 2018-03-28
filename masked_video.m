clc;clear all;close all;

% Add the Heatmaps folder and all its subfolders to the search path.
addpath(genpath('D:\Dropbox\MATLAB\Heatmaps'));
addpath(genpath('D:\Dropbox\MATLAB\Set of Rules method'));
addpath(genpath('D:\Dropbox\MATLAB\Video Tools'));
addpath(genpath('D:\Dropbox\MATLAB\Main'));

VideoObject_humans=VideoReader('D:\Dropbox\MATLAB\Videos\New Videos\untitled.mp4');    %Read a video 
nFrames_humans=VideoObject_humans.NumberOfFrames; %read VideoObject_humans number of frames
dimensions1=VideoObject_humans.Height*VideoObject_humans.Width;    %Get the 1st video's dimensions
warning('off','all')    %Disable the warnings

%%
% Loop to get the background

for k=1:5 %For the first 5 frames
    
    thisframe=read(VideoObject_humans,k);  %Read current frame
    bgimage(:,:,:,k)=thisframe; %Write current frame to dynamically changing 4D array
    
end

%% Loop for video frames

for k=25:(nFrames_humans-1) %For all the frames
    
    img=read(VideoObject_humans,k);    %Read the current frame
    closedBW=extract_silhouette_bg_sub(bgimage(:,:,:,1),bgimage(:,:,:,2),bgimage(:,:,:,3),bgimage(:,:,:,4),img);
    
% %     extract also the perimeter for showing
%     perim=extract_perim_bg_sub(bgimage(:,:,:,1),bgimage(:,:,:,2),bgimage(:,:,:,3),bgimage(:,:,:,4),img);
    binaryImage = bwareafilt(closedBW, 3); %extract the biggest object from the binary image
    
    mask = imfill(binaryImage, 'holes');    %fill holes in the binary image
    
    maskedImage = bsxfun(@times, img, cast(mask, 'like', img)); % Mask the original image
    maskedImage=uint8(maskedImage);
    
%     %display the image
    h=imshow(maskedImage);
    
    %performance improvements
    set(h,'EraseMode','none')
    drawnow
    set(gcf,'doublebuffer','off');

    
     %%display 4 images together
     
%    subplot(2,2,1);
%     imshow(img);
%     drawnow
%       subplot(2,2,2);
%     imshow(closedBW);
%     drawnow
%        subplot(2,2,3);
%     imshow(perim);
%     drawnow
%        subplot(2,2,4);
%     imshow(maskedImage);
%     drawnow
%     
  
    
   % uncomment to write images to files
%     outputBaseFileName = sprintf('%3.3d.jpg', k);
%     imwrite(maskedImage, outputBaseFileName, 'jpg');
     
end
