function [residual_noise,filter_image]= getResidualNoiseDouble(Image)
% [residual_noise,filter_image]= getResidualNoiseDouble(Image)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata due volte con
% il filtro PNU ed il rumore residuo dell'immagine
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

filter_image=filtro_PNU(Image,5);
filter_image=filtro_PNU(filter_image,5);
residual_noise=double(Image)-double(filter_image);
