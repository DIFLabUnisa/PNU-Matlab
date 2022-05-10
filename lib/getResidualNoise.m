function [residual_noise,filter_image] = getResidualNoise(Image)
% [residual_noise,filter_image]= getResidualNoise(Image)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata con
% il filtro PNU ed il rumore residuo dell'immagine
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


filter_image=filtro_PNU(Image,5);
residual_noise=double(Image)-double(filter_image);
