clear all
close all
pkg load image

im = imread('/home/phelyppe-alex/Imagens/PDI/objetos1.jpg');
% figure('Name', 'Imagem Original')
% imshow(im)

% Transformando a imagem em binária por atribuição direta condicional
imBW = im;
imBW(imBW<=128) = 0;
imBW(imBW>128) = 1;
imBW = logical(imBW);

figure('Name', 'Imagem Binária')
imshow(imBW)

matrizRegioes = uint8(zeros(size(im,1), size(im,2))); % criando uma matriz para salvar as regiões

contadorRegioes = 1;
erros = [0 0];
for(i=2:size(imBW,1)-1)
    for(j=2:size(imBW,2)-1)
        if(imBW(i,j) == 1)
            if(imBW(i-1,j) + imBW(i,j-1) == 0)
                matrizRegioes(i,j) = contadorRegioes;
                contadorRegioes++;
            endif
            if(imBW(i-1,j) + imBW(i,j-1) >= 1)
                if(imBW(i-1,j) == 1)
                    matrizRegioes(i,j) = matrizRegioes(i-1,j);
                else
                    matrizRegioes(i,j) = matrizRegioes(i,j-1);
                endif
            endif
            if((imBW(i-1,j) + imBW(i,j-1) == 2) && (matrizRegioes(i-1,j) != matrizRegioes(i,j-1)))
                if(matrizRegioes(i-1,j) < matrizRegioes(i,j-1))
                    erros = [erros;matrizRegioes(i-1,j) matrizRegioes(i,j-1)];
                else
                    erros = [erros;matrizRegioes(i,j-1) matrizRegioes(i-1,j)];
                endif
            endif    
        endif
    endfor
endfor

figure('Name', 'Separação com erros')
imshow(matrizRegioes, [0, contadorRegioes])

erros(1,1) = erros(2,1);
erros(1,2) = erros(2,2);
erros = unique(sort(erros), 'rows');

for(k=1:size(erros,1))
    for(i=1:size(matrizRegioes,1))
        for(j=1:size(matrizRegioes,2))
            if(matrizRegioes(i,j) == erros(k,1))
                matrizRegioes(i,j) = erros(k,2);
            endif
        endfor
    endfor
endfor

figure('Name', 'Imagem final')
imshow(matrizRegioes, [0 erros(size(erros,1),2)])
title(size(unique(matrizRegioes),1)-1)