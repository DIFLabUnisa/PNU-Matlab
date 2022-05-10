function [n] = getNumCameras(path)

% [n] = getNumCameras(path);
% Esempio: [n] = getNumCameras('/home/utente/APPLICAZIONE/REFERENCE PATTERN/');
% 
% Restituisce il numero di camere registate nel sistema
%
% Roscigno Gianluca - Lanzilli Giuseppe

directory = dir(path);
files = {directory.name};

n=0;

for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
            n=n+1;
    end
end

