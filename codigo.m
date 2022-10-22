clear all
close all

for(i=1:1:39)
    im = imread(strcat('/home/phelyppealex/Imagens/Fotos_Ir_Gracileide_22_out_2022/',mat2str(i),'.HEIC'));
    
    imwrite(im,strcat('/home/phelyppealex/Imagens/',mat2str(i),'.jpg'))
endfor