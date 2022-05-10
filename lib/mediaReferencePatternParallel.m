function [referencePattern]=mediaReferencePatternParallel(percorso)
% [referencePattern]=mediaReferencePattern(percorso)
% Data una directory (Compute Photo, Es: C:\......\ oppure: /home/utente/.../),
% la funzione restituisce la media  dei rumori residui delle immagini contenute nella stessa.
% Il rumore residuo e' calcolato con la funzione "[residual_noise]=getResidualNoise(image)".
%
% Autore: Andrea Bruno

p=gcp('nocreate'); % If no pool, do not create new one.

if isempty(p)
    p=parpool('threads');
end
% poolsize = p.NumWorkers;


flag=0;
numeroImmagini=0;
directory = dir(fullfile(percorso,'*.jpg'));
files = {directory.name};

filter_image=[];
num_images = length(files);

parfor i = 1 : length(files)
    fprintf("Extract RN for image %d of %d\n",i,num_images)
    [~,img_name,~] = fileparts(char(files(i)))
    dest_file_name = sprintf("%s.mat",img_name)
    dest_noise_path=fullfile(percorso,dest_file_name);
    if ~isfile(dest_noise_path)
        img=imread(fullfile(percorso,char(files(i))));
        [residual_noise]=getResidualNoise(img);
        parsave_rn_fi(dest_noise_path,residual_noise,filter_image);
    end
end
clear residual_noise;

fprintf("Computing RP as RNs averages\n")
mat_files = dir(fullfile(percorso,'*.mat'));
for i = 1 : length(mat_files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
        numeroImmagini=numeroImmagini+1;
        mat_file = fullfile(percorso, mat_files(i).name);
        load(mat_file,'residual_noise');
        if (flag==0)
            immagineMedia=residual_noise;
            flag=1;
        else
            fprintf('Compute Photo %d\n',i-2);
            immagineMedia=immagineMedia+residual_noise;
        end
        clear residual_noise;
        delete(mat_file)
    end
end
immagineMedia=immagineMedia./numeroImmagini;
referencePattern=immagineMedia;
