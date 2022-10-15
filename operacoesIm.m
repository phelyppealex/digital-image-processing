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
figure('Name', 'Operação aritmética');
imshow(imOpArit)

imOperConj = max(imOpArit,imBackG);
figure('Name', 'Operação com Conjuntos - União')
imshow(imOperConj)