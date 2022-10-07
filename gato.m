clear all
close all
pkg load image

im = imread('/home/phelyppe-alex/Imagens/PDI/rgb.jpg');
figure(1)
imshow(im)

im2 = im;
im2 = rgb2gray(im2);

for(i=1:1:size(im,1))
  for(j=1:1:size(im,2))
    if(!(im(i,j,1) > 128 && im(i,j,2) < 128 && im(i,j,3) < 128))
      im(i,j,:) = 255;
    endif
  endfor
endfor

figure(2)
imshow(im)