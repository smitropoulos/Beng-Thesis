clc
clear all;

Ioriginal=imread('I1grayadj.png');
Ioriginal=double(Ioriginal);

Iaftergauss = imgaussfilt(Ioriginal, 2);
Iaftergauss=(Iaftergauss./255);

Iafterwiener = wiener2(Ioriginal,[60,60]);
Iafterwiener=(Iafterwiener./255);

IorMax=max(Ioriginal);
IorMax=max(IorMax);


Ioriginal=(Ioriginal./255);


Iafterwiener=sum((Iafterwiener).^2);
Iafterwiener=sum(Iafterwiener,2);

Iafterwienerlog=10*log10(Iafterwiener); %DB after wiener


Iaftergauss=sum((Iaftergauss).^2);
Iaftergauss=sum(Iaftergauss,2);

Iaftergausslog=10*log10(Iaftergauss); %DB after gauss




%noise only for wiener
noisewiener=Ioriginal-Iafterwiener;
% noisewiener=double(noisewiener);

%noise only for gauss
noisegauss=Ioriginal-Iaftergauss;
% noisegauss=double(noisegauss);


%sum of the squared of all the elements of original
Ioriginal=sum((Ioriginal).^2);
Ioriginal=sum(Ioriginal,2);

%sum of the squared of all the elements of wiener noise
nw=sum((noisewiener).^2);
nw=sum(nw,2);

%sum of the squared of all the elements of gauss noise
gw=sum(noisegauss.^2);
gw=sum(gw,2);

%sum of the squared of all the elements after gauss denoise

Iaftergremoval=sum(Iaftergauss.^2);
Iaftergremoval=sum(Iaftergremoval,2);

%sum of the squared of all the elements after wiener denoise

Iafterwremoval=sum(Iaftergauss.^2);
Iafterwremoval=sum(Iafterwremoval,2);

SNRw=Iafterwremoval/nw;
SNRg=Iaftergremoval/gw;


 subplot(2,2,1)
 imshow(Ioriginal)
 title('Original Image');



 subplot(2,2,3)
 imshow(Iaftergauss)
 title('Gaussian filtered image, \sigma = 2')
 
 
 subplot(2,2,4)
 imshow(Iafterwiener)
 title('Wiener filtered image')

% imwrite(Iafterwiener,'wie.png')
% 

% 
% nw=0,0000;
% 
% for i=1:size(noisewiener,1)
%     
%     for k=1:size(noisewiener,2)
%      
%         nw=nw+(noisewiener(i,k)^2);
%         
%         disp(nw)
%         
%     end
%     
% end
% 
% gw=0,0000;
% 
% for i=1:size(noisegauss,1)
%     
%     for k=1:size(noisegauss,2)
%      
%         gw=gw+(noisegauss(i,k)^2);
%         
%         disp(gw)
%         
%     end
%     
% end
% 

