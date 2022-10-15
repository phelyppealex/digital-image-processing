clear all
close all

im = imread('/home/phelyppealex/Documentos/digital-image-processing/mulherNeg.jpg');
figure('Name', 'Imagem original: mulher em negativo')
imshow(im)

roi = imread('/home/phelyppealex/Documentos/digital-image-processing/ROI_circular.jpg');

imBackG = imread('/home/phelyppealex/Documentos/digital-image-processing/flores.jpg');
figure('Name', 'Imagem das flores')
imshow(imBackG)

% Criando ROI lógica
roiBW = zeros(size(roi,1), size(roi,2));
roiBW(roi<=128) = 0;
roiBW(roi>128) = 1;
roiBW = logical(roiBW);

figure('Name', 'ROI lógica')
imshow(roiBW)

% Multiplicando a imagem pela máscara
imOpArit = roiBW .* im;
figure('Name', 'Operação Aritmética');
imshow(imOpArit)

% Operação de união
imOperConj = max(imOpArit,imBackG);
figure('Name', 'Operação com Conjuntos - União')
imshow(imOperConj)

% Operação Ponto a Ponto
imOperP2P = 255 - imOperConj;
figure('Name', 'Operação Ponto a Ponto - Negativo')
imshow(imOperP2P)

% Invertendo eixo X
imTGeo = imOperP2P;
for(i=1:size(imTGeo,2))
    imTGeo(:,size(imTGeo,2)-i+1,:) = imOperP2P(:,i,:);
endfor
figure('Name', 'Transformação Geométrica – Espelhamento Horizontal')
imshow(imTGeo)

% Gerando imagem final
imNeg = zeros(size(im,1),size(im,2));
imNeg = (255-im).*roiBW;
imInv = imNeg;
for(i=1:size(imNeg,2))
    imInv(:,i,:) = imNeg(:,size(imNeg,2)-i+1,:);
endfor
figure('Name', 'Operações matriciais – Imagem Final')
imshow(imInv)