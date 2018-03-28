%Create Video with Image Sequence
clear all
clc

%Make the Below path as the Current Folder
cd('D:\Dropbox\MATLAB\Mask\extracted images');

%Obtain all the JPEG format files in the current folder
Files = dir('*.jpg');

%Number of JPEG Files in the current folder
NumFiles= size(Files,1);


%To write Video File
VideoObj = VideoWriter('Create_Video01.avi');
%Number of Frames per Second
VideoObj.FrameRate = 30; 
%Define the Video Quality [ 0 to 100 ]
VideoObj.Quality   = 80;  

%Open the File 'Create_video01.avi'
open(VideoObj);

for i = 1 : NumFiles
   
   %Read the Image from the current Folder
   I = imread(Files(i).name);
    
   %Resize Image
   ResizeImg = imresize(I,[600 1000]);
   [X, map] = gray2ind(ResizeImg,2);
   %Convert Image to movie Frame
   frame = im2frame(X,map);
  
   %Each Frame is written five times.
      for j = 1 : 5
          %Write a frame
          writeVideo(VideoObj, frame);
      end
 
end


%Close the File 'Create_Video01.avi
close(VideoObj);
