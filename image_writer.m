function image_writer(frame,f,outputFolder)
    

%{
------------------------------Image Writer--------------------------------
Extract an image in png format in the specified output folder. The name of
the image is going to be set by f. This method is designed to be used in a
loop for multiple images.

Inputs: 
        frame : the frame to be exported
        f : the loop counter
        outputFolder : the folder name to extract the images into

The method also creates a directory and displays the progress of the
writing of frames.
%}


outputFolder=char(outputFolder);
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end

      
    outputBaseFileName = sprintf('%3.3d.png', f);
    outputFullFileName = fullfile(outputFolder, outputBaseFileName);
    imwrite(frame, outputFullFileName, 'png');
    progressIndication = sprintf('Writing frames to disk');
    disp(progressIndication)
    
end