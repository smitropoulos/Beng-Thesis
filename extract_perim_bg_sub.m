function perim=extract_perim_bg_sub (bg1,bg2,bg3,bg4,fg1)

bg = imlincomb(0.25,bg1,0.25,bg2,0.25,bg3,0.25,bg4);

Iabsdiff=imabsdiff(fg1,bg); %Gets the absolute subtractions of the images

I1gray=rgb2gray(Iabsdiff);

I1grayadj=imadjust(I1gray);     %Perform Histogram Stretching
I1grayfiltered = wiener2(I1grayadj,[60,60]);    %Apply a Wiener filter in 60 by 60 neighbourhoods
level = graythresh(I1grayfiltered); %Calculate the global threshold of the image using Otsu's method     
bw1=im2bw(I1grayfiltered,level);    %Threshold the image using the threshold calculated above

se = strel('disk',25,8);

closeBW = imclose(bw1,se); %Use the morphological operator to fill the silhouette

perim=bwperim(closeBW); %Extract the silhouette's contour

end