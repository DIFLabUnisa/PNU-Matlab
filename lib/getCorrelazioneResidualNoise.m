function [corr]=getCorrelazioneResidualNoise(PathImage, PatternNoise)
% Effettua la correlazione tra il rumore residuo di PathImage e l'immagine
% PatterNoise
% [corr]=getCorrelazioneResidualNoise(PathImage, PatternNoise)
% PathImage e' il path dell'immagine da correlare con il PatterNoise
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


Image=imread(PathImage);
[residual_noise,filter_image]= getResidualNoise(double(Image));
[corr] = correlazione(double(residual_noise), double(PatternNoise));
