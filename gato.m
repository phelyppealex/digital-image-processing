clear all
close all
pkg load image

im = imread('/home/phelyppe-alex/Downloads/ph.jpeg');
figure(1)
imshow(im)

im2 = im;
im2 = rgb2gray(im2);

for(i=1:1:size(im,1))
  for(j=1:1:size(im,2))
    if(im(i,j) > 150 && im(i,j) < 200)
      im2(i,j) = 255;
    else
      im2(i,j) = im2(i,j);
    endif
  endfor
endfor

figure(2)
imshow(im2)
