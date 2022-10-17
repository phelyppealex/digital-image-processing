clear all
close all
pkg load image

im = imread('/home/phelyppealex/Documentos/digital-image-processing/Lena.jpg');
figure('Name','Imagem original: Lena.jpg')
imshow(im)

imCinza = rgb2gray(im);

imPeq = uint8(zeros(size(imCinza,1)/2,size(imCinza,2)/2));

contY = 1;
contX = 1;
for(i=1:2:size(imCinza,1))
    for(j=1:2:size(imCinza,2))
        imPeq(contX,contY) = imCinza(i,j);
        contY += 1;
    endfor
    contY=1;
    contX += 1
endfor

figure('Name','Imagem ')
imshow(imPeq)