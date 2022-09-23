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

vHist = imhist(imGray);
menorIntensidade = 0;

% For para procurar menor intensidade
for(i=1:256)
  if(vHist(i) != 0)
    menorIntensidade = i;
    break;
  endif
endfor