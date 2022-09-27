clear all
close all
pkg load image

im = imread('/home/phelyppe-alex/Downloads/graosBaixoContraste.png');
figure('Name', 'Imagem Original: Baixo Contraste')
imshow(im)

imGray = rgb2gray(im); % Convertendo imagem original em escalas de cinza

% Criando figura para mostrar imagem em escalas de cinza
figure('Name', 'Imagem em escala de cinza')
imshow(imGray)

figure('Name', 'Histograma da imagem')
imhist(imGray)

vHist = imhist(imGray); % Guardando o histograma em um vetor

menorIntensidade = 0;
% For para encontrar menor intensidade
for(i=1:256)
  if(vHist(i) != 0)
    menorIntensidade = i
    break;
  endif
endfor

maiorIntensidade = 0;
% For para encontrar maior intensidade
for(i=256:-1:1)
  if(vHist(i) != 0)
    maiorIntensidade = i
    break;
  endif
endfor

% Espaço que cada intensidade terá no histograma final
espacoIntensidades = floor(256/ (maiorIntensidade+1-menorIntensidade))

vHistNovo = vHist;
vHistNovo(:) = 0;

cont = 1
for(i=menorIntensidade:maiorIntensidade)
  vHistNovo(cont) = i;
  cont = cont + espacoIntensidades;
endfor

for(i=1:size(imGray,1))
  for(j=1:size(imGray,2))
    for(k=1:256)
      if(imGray(i,j) == vHistNovo(k))
        imGray(i,j) = k;
      endif
    endfor
  endfor
endfor

figure('Name', 'Imagem final')
imshow(imGray)