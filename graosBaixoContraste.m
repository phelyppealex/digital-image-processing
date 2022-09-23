clear all
close all
pkg load image

im = imread('/home/phelyppe-alex/Downloads/graosBaixoContraste.png');
figure('Name', 'Imagem original: Baixo Contraste')
imshow(im)

im2 = rgb2gray(im);

imGray = rgb2gray(im);
figure('Name', 'Histograma da original')
imhist(imGray)

for(i=1:1:size(im2,1))
  for(j=1:1:size(im2,2))
    im2(i,j) = imGray(i,j)-88;
  endfor
endfor

for(i=1:1:size(im2,1))
  for(j=1:1:size(im2,2))
    im2(i,j) = im2(i,j) * 3.923076923076923;
  endfor
endfor

figure('Name', 'Imagem final')
imshow(im2)

figure('Name', 'Histograma final')
imhist(im2)
