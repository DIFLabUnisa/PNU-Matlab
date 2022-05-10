function [referencePattern]=mediaReferencePattern2(percorso, immaginiDaMediare)
% [referencePattern]=mediaReferencePattern2(percorso, immaginiDaMediare)
% Data una directory (percorso, Es: C:\......\ oppure: /home/utente/.../),
% la funzione restituisce la media  dei rumori residui delle prime n immagini contenute nella stessa,
% dove n è "immaginiDaMediare". Il rumore residuo e' calcolto con la funzione "[residual_noise]=getResidualNoise(image)".
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


flag=0;
numeroImmagini=0;
directory = dir(percorso);
files = {directory.name};

for i = 1 : length(files)
    
    if i > (immaginiDaMediare+2)
        break;
    end
        
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
        numeroImmagini=numeroImmagini+1;
        if (flag==0)
            fprintf('Compute Photo %d\n',i-2);
            img=imread(strcat(percorso,char(files(i))));
            [residual_noise]=getResidualNoise(img);
            immagineMedia=residual_noise;
            flag=1;
            clear img residual_noise;
        else
            fprintf('Compute Photo %d\n',i-2);
            img=double(imread(strcat(percorso,char(files(i)))));
            [residual_noise]=getResidualNoise(img);
            immagineMedia=immagineMedia+residual_noise;
            clear img residual_noise;
        end
    end
end
immagineMedia=immagineMedia./numeroImmagini;
referencePattern=immagineMedia;
