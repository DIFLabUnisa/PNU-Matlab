function [residual_noise,filter_image]= getResidualNoiseAdattivo2(Image,db)
% [residual_noise,filter_image]= getResidualNoiseAdattivo(Image,db)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata con
% il filtro PNU ed il rumore residuo dell'immagine
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


filter_image=filtro_PNUAdattivo(Image,5,db);
residual_noise=double(Image)-double(filter_image);
