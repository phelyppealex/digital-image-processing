clear all
close all
pkg load image

% ---------------------------------------------------------------------------------------

im1 = imread('/home/phelyppe-alex/Downloads/soja.jpg');
figure('name', 'Imagem original');
imshow(im1);

im2 = rgb2gray(im1); % im2 recebe im1 com escalas de cinza

vetor = imhist(im2) % pondo o histograma de im2 em um vetor coluna
imhist(im2)
vHist(1,:) = vetor(:,1); % transformando o vetor de coluna em um vetor de linha

graficoED = vHist; % criando variável para guardar gráfico modularizado da esquerda pra direita
graficoDE = vHist; % criando variável para guardar gráfico modularizado da direita pra esquerda

% ------------Percorrendo histograma, pegando maior valor Esquerda/Direita---------------

for(i=2:1:256)
  if(graficoED(i) < graficoED(i-1))
    graficoED(i) = graficoED(i-1);
  endif
endfor

% ------------Percorrendo histograma, pegando maior valor Direita/Esquerda---------------

for(i=255:-1:1)
  if(graficoDE(i) < graficoDE(i+1))
    graficoDE(i) = graficoDE(i+1);
  endif
endfor

%-----------------------------------------------------------------------------------------

% Pegando índice da moda ED
iModaED = 0
for(i=1:1:256)
  if(graficoED(i) == mode(graficoED))
    iModaED = i;
    break;
  endif
endfor

modaED = mode(graficoED)

% Pegando índice da moda DE
iModaDE = 0
for(i=255:-1:1)
  if(graficoDE(i) == mode(graficoDE))
    iModaDE = i;
    break;
  endif
endfor

modaDE = mode(graficoDE)

figure('Name', 'Gráfico modularizado ED')
plot(graficoED)

figure('Name', 'Gráfico modularizado DE')
plot(graficoDE)

depressao = modaED; % Variável para auxiliar no encontro do menor valor do intervalo
iDepressao = 0;
for(i=iModaED:1:iModaDE)
  if(depressao > vHist(i))
    depressao = vHist(i);
    iDepressao = i; % Captura o índice do menor valor para o corte da imagem
  endif
endfor

% Faz o corte da imagem segundo o ponto de corte encontrado anteriormente

for(i=1:1:size(im2,1))
  for(j=1:1:size(im2,2))
    if(im2(i,j) <= iDepressao)
      im2(i,j) = 255;
    endif
  endfor
endfor

figure('Name', 'Imagem preto e branca.')
imshow(im2);

% Faz o corte da imagem colorida

for(i=1:1:size(im2,1))
  for(j=1:1:size(im2,2))
    if(im2(i,j) == 255)
      im1(i,j,:) = 255;
    endif
  endfor
endfor

%figure('Name', 'Imagem final.')
imshow(im1);