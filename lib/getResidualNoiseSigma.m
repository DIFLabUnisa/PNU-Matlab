function [residual_noise,filter_image]= getResidualNoiseSigma(Image, sigma0)
% [residual_noise,filter_image]= getResidualNoise(Image, sigma)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata con
% il filtro PNU ed il rumore residuo dell'immagine. La funzione prende in input il
% valore sigma0 da utilizzare nel calcolo dell'immagine filtrata
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

filter_image=filtro_PNU(Image, sigma0);
residual_noise=double(Image)-double(filter_image);
