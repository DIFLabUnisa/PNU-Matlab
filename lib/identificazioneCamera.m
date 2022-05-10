function identificazioneCamera(percorsoRP, immaginePercorso, nomeImmagine, FID_FileCorrelazione)
%  identificazioneCamera(percorsoRP,immaginePercoso, nomeImmagine, FID_FileCorrelazione)
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

% fprintf('percorsoRP: %s \n',percorsoRP);
% fprintf('immaginePercorso: %s \n',immaginePercorso);
% fprintf('nomeImmagine: %s \n', nomeImmagine);


FileCorrelazione=FID_FileCorrelazione;
immagine=imread(immaginePercorso);
cartellaFormato=substring(immaginePercorso,length(immaginePercorso)-3,length(immaginePercorso));
[riga,colonna]=size(immagine(:,:,1));
confronto=[int2str(riga),'x',int2str(colonna)];
directory = dir(percorsoRP); % prima cartella

if(length(directory)==2)
    %fprintf('directory %s è vuota\n',percorsoRP);
    return;
end

flag=0;
%fprintf('%s\n',percorsoRP);
for i = 3 : length(directory)
    if(strcmp(confronto,directory(i).name)==1)
        flag=1;
        break;
    end
end
if(flag==0)
    %fprintf('non è presente un reference pattern per tali dimensioni %s \n',confronto);
    return;
end
percorsoRP=strcat(percorsoRP,directory(i).name);
percorsoRP=strcat(percorsoRP,'/');

directory = dir(percorsoRP);% seconda cartella
if(length(directory)==2)
    %fprintf('directory %s è vuota\n',percorsoRP);
    return;
end
%fprintf('%s\n',percorsoRP);
flag=0;
for i = 3 : length(directory)
   if(strcmp(cartellaFormato,directory(i).name)==1)
        flag=1;
        break;
    end
end
if(flag==0)
    %fprintf('non è presente un reference pattern per tale formato %s \n',cartellaFormato);
    return;
end
percorsoRP=strcat(percorsoRP,directory(i).name);
percorsoRP=strcat(percorsoRP,'/');

directory = dir(percorsoRP);% terza cartella
files = {directory.name};
%fprintf('%s\n',percorsoRP);
[residual_noise]=getResidualNoise(immagine);
clear immagine;

for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../


        fileRP=strcat(percorsoRP,char(files(i)));
        load (fileRP);
        result_corr=correlazione(referencePattern,residual_noise);

	nomePattern=strrep(char(files(i)),'.mat','');

        [corr1] = replaceSTR(sprintf('%g',result_corr(1)));
        [corr2] = replaceSTR(sprintf('%g',result_corr(2)));
        [corr3] = replaceSTR(sprintf('%g',result_corr(3)));

        fprintf(FileCorrelazione,'%s RN(%s) %s %s %s\n\n', nomePattern, nomeImmagine, corr1, corr2, corr3);
       
    end
end


