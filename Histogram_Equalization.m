close all
clear all
clc


image=imread('12.jpg'); %reading of image
image=rgb2gray(image);  %converting to RGB
[r,c]=size(image);      %Finding Total pixels
subplot(121)            %subploting original image
imshow(image)
title('input image')

pdf=zeros(size(image)); %creating array of zeros of image size

for i=1:r
    for j=1:c
        pdf(image(i,j)+1)=pdf(image(i,j)+1)+1;   %finding the pdf
    end
end

cdf=zeros(size(image));
cdf(1)=pdf(1);

for m=2:256
    cdf(m)=cdf(m-1)+pdf(m);   %Finding the cdf
end

f=(cdf./(r*c))*255; % Normalizing The cdf
f=round(f);

for i=1:r
    for j=1:c
        image(i,j)=f(image(i,j)+1);
    end
end

subplot(122)
imshow(image)
title('output image')
