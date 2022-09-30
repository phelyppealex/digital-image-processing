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
        endif
    endfor
endfor

figure('Name', 'Separação com erros')
imshow(matrizRegioes, [0, contadorRegioes])

%for(i=2:size(imBW,1)-1)
%    for(j=2:size(imBW,2)-1)
%        if()
%    endfor
%endfor