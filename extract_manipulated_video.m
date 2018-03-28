
clc
close all
clear all
addpath('D:\Dropbox\MATLAB\Main');

source='D:\Dropbox\MATLAB\Database Extraction\Case 3 Stool\untitled2.mp4';
mov=VideoReader(source);
numberOfFrames=mov.Numberofframes;
numberOfFramesWritten = 0;

% Loop to get the background

for k=1:5 %For the first 5 frames
    
    thisframe=read(mov,k);  %Read current frame
    bgimage(:,:,:,k)=thisframe; %Write current frame to dynamically changing 4D array
    
end

% Combine the background images and extract a mean
bg = imlincomb(0.25,bgimage(:,:,:,1),0.25,bgimage(:,:,:,2),0.25,bgimage(:,:,:,3),0.25,bgimage(:,:,:,4));


% Output folder

outputFolder = fullfile(fileparts(source), 'Extracted Frames');
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end


for f=1:(numberOfFrames-1)
    
    thisframe=read(mov,f);
    
    thisframe=extract_perim_singlebg(bg,thisframe);
    
    outputBaseFileName = sprintf('%3.3d.png', f);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite(thisframe, outputFullFileName, 'png');
    progressIndication = sprintf('Wrote frame %4d of %d.', f,numberOfFrames);
    disp(progressIndication);
    numberOfFramesWritten = numberOfFramesWritten + 1;
    
end

progressIndication = sprintf('Wrote %d frames to folder "%s"',numberOfFramesWritten, outputFolder);
disp(progressIndication);





