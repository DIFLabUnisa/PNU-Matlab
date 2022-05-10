function [immagineMedia]=media(percorso)
% [immagineMedia]=media(percorso)
% Data una directory (Es: C:\......\ oppure: /home/utente/.../),
% la funzione restituisce la media delle immagini contenute nella stessa.
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

flag=0;
numeroImmagini=0;
directory = dir(percorso);
files = {directory.name};

for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
        numeroImmagini=numeroImmagini+1;
        if (flag==0)
            immagineMedia=double(imread(strcat(percorso,char(files(i)))));
            flag=1;
        else
            img=double(imread(strcat(percorso,char(files(i)))));
            immagineMedia=immagineMedia+img;
            clear img;
        end
    end
end
immagineMedia=immagineMedia./numeroImmagini;

