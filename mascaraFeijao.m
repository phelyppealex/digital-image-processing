clear all
close all

im = imread('/home/phelyppealex/Documentos/digital-image-processing/imagem1,L1,C1.jpg');

imLogica = im;

imLogica(im <= 169) = 255;
imLogica(im > 169) = 0;
imLogica = logical(imLogica);

%for(i=1:size(imLogica,1))
%    for(j=1:size(imLogica,2))
%
%    endfor
%endfor

figure('Name','Original')
imshow(im)

figure('Name','Máscara')
imshow(imLogica)
