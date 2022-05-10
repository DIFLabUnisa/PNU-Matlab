function [corr]=getCorrelazioneOnFilteredImages(PathImage, imageFiltered)
% Effettua la correlazione tra l'immagine filtrata di PathImage e l'immagine imageFiltered 
% [corr]=getCorrelazioneOnFilteredImages(PathImage, imageFiltered)
% PathImage e' il path dell'immagine da correlare con l'immagine filtrata
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


Image=imread(PathImage);
[residual_noise,filter_image]= getResidualNoise(double(Image));
[corr] = correlazione(double(filter_image), double(imageFiltered));




