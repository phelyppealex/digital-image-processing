clear all
close all
pkg load image

im = imread('/home/phelyppe-alex/Imagens/PDI/objetos1.jpg');
figure('Name', 'Imagem Original')
imshow(im)

imBW = logical(im); % Transformando a imagem em binária
matrizRegioes = zeros(size(im,1), size(im,2)); % criando uma matriz para salvar as regiões

contadorRegioes = 2;
for(i=2:size(imBW, 1)-1)
  for(j=2:size(imBW, 2)-1)

    if(imBW(i,j) == 0)
      matrizRegioes(i,j) = 1;
    else
      if((imBW(i,j-1) == 1) || (imBW(i-1,j) == 1))
        if(imBW(i,j-1) == 1)
          matrizRegioes(i,j) = matrizRegioes(i,j-1);
        endif
        if(imBW(i-1,j) == 1)
          matrizRegioes(i,j) = matrizRegioes(i-1,j);
        endif
      else
        matrizRegioes(i,j) = contadorRegioes;
        contadorRegioes = contadorRegioes + 1;
      endif
    endif

  endfor
endfor