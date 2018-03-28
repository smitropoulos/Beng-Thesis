function multiple_images_loader(path,type)

%{
-------------------------------Image Loader--------------------------------

Load multiple images and edit them one by one. 

Inputs:
        path: the complete path of the folder containing the images
        type: the type of the images (extension)

%}

    
%     path = 'C:\Users\stefm\Desktop\FramesC=3M=3D=3A=0.01Thresh=0.25SD=6';
%     type = '*.png'; % change based on image type
    images  = dir(path);
    N = length(images);

    % check images
    if( ~exist(path, 'dir') || N<1 )
        display('Directory not found or no matching images found.');
    end
    
    for n=1:N
       
        name=sprintf('%d.%d',n,type);
        image = imread(name);
        
     
       %{
        DO STUFF HERE
        %} 
       
    end
    
    %Chirp when it ends    
    load chirp, sound(y,2*Fs);