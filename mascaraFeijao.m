clear all
close all

im = imread('/home/phelyppealex/Documentos/digital-image-processing/imagem1,L1,C1.jpg');

imLogica = im;

% Definindo o ponto da limiarização e criando a máscara
imLogica(im <= 169) = 255;
imLogica(im > 169) = 0;
imLogica = logical(imLogica);

% Criando contador de regiões, a matriz de regiões e o vetor de erros de contagem
contRegioes = 1;
vRegioes = zeros(size(imLogica,1),size(imLogica,2));
erros = [0 0];

% Fazendo a contagem de regiões com erros
for(i=1:size(imLogica,1))
    for(j=1:size(imLogica,2))
        if(imLogica(i,j))
            if(i>1 && j>1)
                if(((imLogica(i-1,j) + imLogica(i,j-1)) == 2) && vRegioes(i-1,j) != vRegioes(i,j-1))
                    erros = [erros; vRegioes(i-1,j) vRegioes(i,j-1)];
                endif
                if((imLogica(i-1,j) + imLogica(i,j-1)) >= 1)
                    if(imLogica(i-1,j) > imLogica(i,j-1))
                        vRegioes(i,j) = vRegioes(i-1,j);
                    else
                        vRegioes(i,j) = vRegioes(i,j-1);
                    endif
                elseif((imLogica(i-1,j) + imLogica(i,j-1)) == 0)
                    vRegioes(i,j) = contRegioes;
                    contRegioes++;
                endif
            endif
        endif
    endfor
endfor

% Otimizando a matriz de erros
erros(1,1) = erros(2,1);
erros(1,2) = erros(2,2);
for(i=1:size(erros,1))
    if(erros(i,1) > erros(i,2))
        flag = erros(i,1);
        erros(i,1) = erros(i,2);
        erros(i,2) = flag;
    endif
endfor
erros = unique(erros, 'rows')

% Corrigindo os erros de contagem
for(i=1:size(vRegioes,1))
    for(j=1:size(vRegioes,2))
        for(k=1:size(erros,1))
            if(vRegioes(i,j) == erros(k,1))
                vRegioes(i,j) = erros(k,2);
            endif
        endfor
    endfor
endfor

% Contando a nova quantidade de regiões
vNovasReg = [0];
for(i=1:size(vRegioes,1))
    for(j=1:size(vRegioes,2))
        if(vRegioes(i,j) > vNovasReg(size(vNovasReg,2)))
            vNovasReg = [vNovasReg vRegioes(i,j)];
        endif
    endfor
endfor
vNovasReg

% Renumerando regiões
for(i=1:size(vRegioes,1))
    for(j=1:size(vRegioes,2))
        for(k=1:size(vNovasReg,2))
            if(vNovasReg(k) == vRegioes(i,j))
                vRegioes(i,j) = k;
            endif
        endfor
    endfor
endfor

figure('Name','Original')
imshow(imLogica)

figure('Name','Máscara')
imshow(vRegioes)
title(contRegioes)
