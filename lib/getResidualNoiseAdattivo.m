function [residual_noise,filter_image]= getResidualNoiseAdattivo(Image, db_family, righe, colonne, colore)
% [residual_noise,filter_image]= getResidualNoiseAdattivo(Image, db_family, righe, colonne, colore)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata con
% il filtro PNU ed il rumore residuo dell'immagine, in accordo ai parametri utilizzati come input
% colore può assumere i valori 'RGB' o 'GS' (GrayScale)
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

Image=Image(1:righe, 1:colonne, :);

if(strcmp(colore,'GS')==1) % trasformare l'immagine in scala di grigio.
	I = rgb2gray(Image);
else
	I = Image;
end


filter_image=filtro_PNUAdattivo(I,5,db_family);
residual_noise=double(I)-double(filter_image);



