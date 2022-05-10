function [residual_noise,filter_image]= getResidualNoiseSigma(Image, sigma0, db_family)
% [residual_noise,filter_image]= getResidualNoise(Image, sigma, db_family)
% Data una immagine, Image, la funzione restituisce l'immagine filtrata con
% il filtro PNU ed il rumore residuo dell'immagine. La funzione prende in input il
% valore sigma0 da utilizzare nel calcolo dell'immagine filtrata.
% Inoltre, si sceglie il tipo di famiglia di wavelets da utilizzare (db_family, esempio: 'db2', 'db4', 'db8'). 
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

filter_image=filtro_PNUAdattivo(Image, sigma0, db_family);
residual_noise=double(Image)-double(filter_image);