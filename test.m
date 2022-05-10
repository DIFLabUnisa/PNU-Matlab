function [ris] = test(immagine, patternNoise)
% [ris] = test(immagine, patternNoise)
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

Img=imread(immagine);
[ResidualNoise]=getResidualNoise(double(Img));
%load patternNoiseScatola
[ris] = correlazione(double(patternNoise),double(ResidualNoise));
