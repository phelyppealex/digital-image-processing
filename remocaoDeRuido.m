clear all
close all

im = imread('/home/phelyppealex/Documentos/digital-image-processing/noise.png');
figure('Name','Imagem Orginal')
imshow(im)

for(i=2:size(im,1)-1)
    for(j=2:size(im,2)-1)
%        if(i==1 && j==1)
%            vetor = [im(i,j+1) im(i+1,j) im(i+1,j+1)];
%        elseif(i==1 && j==size(im,2))
%            vetor = [im(i,j-1) im(i+1,j-1) im(i+1,j)];
%        elseif(i==size(im,1) && j==1)
%            vetor = [im(i-1,j) im(i-1,j+1) im(i,j+1)];
%        elseif(i==size(im,1) && j==size(im,2))
%            vetor = [im(i-1,j-1) im(i-1,j) im(i,j-1)];
%        elseif(!((i==1 && j==1) && (i==1 && j==size(im,2)) && (i==size(im,1) && j==1) && (i==size(im,1) && j==size(im,2))))
%            vetor = [im(i-1,j-1) im(i-1,j) im(i-1,j+1) im(i,j-1) im(i,j+1) im(i+1,j-1) im(i+1,j) im(i+1,j+1)];
%        endif
        vetor = [im(i-1,j-1) im(i-1,j) im(i-1,j+1) im(i,j-1) im(i,j+1) im(i+1,j-1) im(i+1,j) im(i+1,j+1)];
        im(i,j,:) = median(vetor);
    endfor
endfor

figure('Name','Ruído removido')
imshow(im)
