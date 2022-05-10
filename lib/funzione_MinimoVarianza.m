function [minimo]=funzione_MinimoVarianza(A,B,C,D)
% [minimo]=funzione_MinimoVarianza(A,B,C,D)
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

minimo=min(A,B);
minimo=min(minimo,C);
minimo=min(minimo,D);
