function identificazione(percorso,immaginePercoso)
%  identificazione(percorso,immaginePercoso)
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


FileCorrelazione=fopen('correlazione.txt','wt');
immagine=imread(immaginePercoso);
cartellaFormato=substring(immaginePercoso,length(immaginePercoso)-3,length(immaginePercoso));
[riga,colonna]=size(immagine(:,:,1));
confronto=[int2str(riga),'x',int2str(colonna)];
directory = dir(percorso); % prima cartella
if(length(directory)==2)
    fprintf('directory %s è vuota\n',percorso);
    return;
end
flag=0;
fprintf('%s\n',percorso);
for i = 3 : length(directory)
    if(strcmp(confronto,directory(i).name)==1)
        flag=1;
        break;
    end
end
if(flag==0)
    fprintf('non è presente un reference pattern per tali dimensioni %s \n',confronto);
    return;
end
percorso=strcat(percorso,directory(i).name);
percorso=strcat(percorso,'\');

directory = dir(percorso);% seconda cartella
if(length(directory)==2)
    fprintf('directory %s è vuota\n',percorso);
    return;
end
fprintf('%s\n',percorso);
flag=0;
for i = 3 : length(directory)
   if(strcmp(cartellaFormato,directory(i).name)==1)
        flag=1;
        break;
    end
end
if(flag==0)
    fprintf('non è presente un reference pattern per tale formato %s \n',cartellaFormato);
    return;
end
percorso=strcat(percorso,directory(i).name);
percorso=strcat(percorso,'\');

directory = dir(percorso);% terza cartella
files = {directory.name};
fprintf('%s\n',percorso);
[residual_noise]=getResidualNoise(immagine);
clear immagine;
for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
        fileRP=strcat(percorso,char(files(i)));
        load (fileRP)
        result_corr=correlazione(ReferencePattern,residual_noise);
        fprintf(FileCorrelazione,'%s %g %g %g\n\n',char(files(i)),result_corr(1),result_corr(2),result_corr(3));
        clear ReferencenNoise;
    end
end
fclose(FileCorrelazione);
fprintf('file correlazione.txt realizzato nella cartella di lavoro \n');
