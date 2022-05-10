function [patternNoise,meanImage,meanImageFiltered] = getPatternNoise(percorso)

%   Data una directory, la funzione restituisce il patter noise e la media delle
%   immagini (filtrata e non) presenti in tale directory
%   [patternNoise,meanImage,meanImageFiltered] = getPatternNoise(percorso);
%   Funzione obsoleta.
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

[meanImage] = media(percorso);

[patternNoise,meanImageFiltered] = getResidualNoise(meanImage);
