clear all
close all
pkg load image

im = imread('C:\Users\Aluno\Pictures\PDI\objetos1.jpg');
figure('Name', 'Imagem Original')
imshow(im)

imBW = logical(im); % Transformando a imagem em binária
matrizRegioes = zeros(im); % criando uma matriz para salvar as regiões

contadorRegioes = 2;
for(i=2:size(imBW, 1)-1)
  for(j=2:size(imBW, 2)-1)
    % Inicializando o primeiro índice
    if(i==2 && j==2)
      matrizRegioes(i,j) = 1;
    endif
    % Percorrendo primeira linha
    if(i==2 && j>2)
      if(imBW(i,j-1) == imBW(i,j))
        matrizRegioes(i,j) = imBW(i,j-1);
      else
        matrizRegioes(i,j) = contadorRegioes;
        contadorRegioes++;
      endif
    % Percorrendo o restante da imagem
    else
      if()

      else
    endif
  endfor
endfor
