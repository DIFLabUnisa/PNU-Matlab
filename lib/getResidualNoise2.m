function [residual_noise,filter_image]= getResidualNoise2(Image, db_family)
% [residual_noise,filter_image]= getResidualNoise2(Image, db_family)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata con
% il filtro PNU ed il rumore residuo dell'immagine, in accordo ai parametri utilizzati come input
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

filter_image=filtro_PNUAdattivo(Image,5,db_family);
residual_noise=double(Image)-double(filter_image);



