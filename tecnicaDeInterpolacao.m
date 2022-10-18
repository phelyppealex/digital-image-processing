clear all
close all
pkg load image

im = imread('/home/phelyppealex/Documentos/digital-image-processing/Lena.jpg');
figure('Name','Imagem original: Lena.jpg')
imshow(im)

% Criando a imagem da Lena em tons de cinza
imCinza = rgb2gray(im);

% Criando uma matriz de zeros para guardar a imagem numa escala menor
imPeq = uint8(zeros(size(imCinza,1)/2,size(imCinza,2)/2));

% Flags para escrita na imagem de tamanho menor
contY = 1;
contX = 1;

modulo = abs(-3)

for(i=1:2:size(imCinza,1))
    for(j=1:2:size(imCinza,2))
        imPeq(contX,contY) = imCinza(i,j);
        contY += 1;
    endfor
    contY=1;
        contX += 1;
endfor

imwrite(imCinza,'/home/phelyppealex/Documentos/interpolacao/Peq.jpg')

imAmpliada = uint8(zeros(size(imCinza,1), size(imCinza,2)));

contX = 1;
contY = 1;
% Gerando uma imagem ampliada da imagem pequena
for(i=1:size(imPeq,1))
    for(j=1:size(imPeq,2))
        imAmpliada(contX,contY) = imPeq(i,j);
        contY += 2;
    endfor
    contY = 1;
    contX += 2;
endfor

% Interpolando as imagens pelo vizinho mais próximo
imVizProx = imAmpliada;
for(i=1:2:size(imVizProx,1))
    for(j=2:2:size(imVizProx,2))
        imVizProx(i,j) = imVizProx(i,j-1);
    endfor
endfor

for(i=2:2:size(imVizProx,1))
    for(j=1:1:size(imVizProx,2))
        imVizProx(i,j) = imVizProx(i-1,j);
    endfor
endfor

imwrite(imVizProx,'/home/phelyppealex/Documentos/interpolacao/VizProximo.jpg')

% Interpolando as imagens pelo método bilinear
imBilinear = imAmpliada;
for(i=1:2:size(imBilinear,1))
    for(j=2:2:size(imBilinear,2))
        if(j == size(imBilinear,2))
            imBilinear(i,j) = imBilinear(i,j-1);
        else
            imBilinear(i,j) = round( (imBilinear(i,j-1) + imBilinear(i,j+1)) /2);
        endif
    endfor
endfor

for(i=2:2:size(imBilinear,1))
    for(j=2:2:size(imBilinear,2))
        if(j != size(imBilinear,2) && i != size(imBilinear,1))
            imBilinear(i,j) = round( (imBilinear(i-1,j-1) + imBilinear(i-1,j+1) + imBilinear(i+1,j-1) + imBilinear(i+1,j+1)) /4);
        else
            if(j == size(imBilinear,2) && i != size(imBilinear,1))
                imBilinear(i,j) = round( (imBilinear(i-1,j-1) + imBilinear(i+1,j-1)) /2);
            else
                if(j != size(imBilinear,2) && i == size(imBilinear,1))
                    imBilinear(i,j) = round( (imBilinear(i-1,j-1) + imBilinear(i-1,j+1)) /2);
                else
                    if(j == size(imBilinear,2) && i == size(imBilinear,1))
                        imBilinear(i,j) = imBilinear(i-1,j-1);
                    endif
                endif 
            endif
        endif
    endfor
endfor

for(i=2:2:size(imBilinear,1))
    for(j=1:2:size(imBilinear,2))
        if(j != size(imBilinear,2) && i != size(imBilinear,1))
            imBilinear(i,j) = round( (imBilinear(i-1,j) + imBilinear(i+1,j)) /2);
        else
            if(i == size(imBilinear,1))
                imBilinear(i,j) = imBilinear(i-1,j);
            endif
        endif
    endfor
endfor

imBilinear(1,1)
imBilinear(1,2)
imBilinear(1,3)

figure('Name', 'Imagem bilinear')
imshow(imBilinear)