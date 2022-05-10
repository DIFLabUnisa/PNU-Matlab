function [referencePattern]=mediaReferencePattern(percorso)
% [referencePattern]=mediaReferencePattern(percorso)
% Data una directory (Compute Photo, Es: C:\......\ oppure: /home/utente/.../),
% la funzione restituisce la media  dei rumori residui delle immagini contenute nella stessa.
% Il rumore residuo e' calcolato con la funzione "[residual_noise]=getResidualNoise(image)".
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
            fprintf('Compute Photo %d\n',i-2);
            %img=imread(strcat(percorso,char(files(i))));
            img=imread(fullfile(percorso,char(files(i))));
            [residual_noise]=getResidualNoise(img);
            immagineMedia=residual_noise;
            flag=1;
            clear img residual_noise;
        else
            fprintf('Compute Photo %d\n',i-2);
            %img=double(imread(strcat(percorso,char(files(i)))));
            img=imread(fullfile(percorso,char(files(i))));
            [residual_noise]=getResidualNoise(img);
            immagineMedia=immagineMedia+residual_noise;
            clear img residual_noise;
        end
    end
end
immagineMedia=immagineMedia./numeroImmagini;
referencePattern=immagineMedia;
