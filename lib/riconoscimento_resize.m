function riconoscimento_resize(directoryImages, percorsoFileOutput, percorsoRP, descrizione)

%  riconoscimento_resize(directoryImages, percorsoFileOutput, percorsoRP, descrizione)
%
%
% Autori: Lanzilli Giuseppe- Roscigno Gianluca

FileCorrelazione=fopen(percorsoFileOutput,'wt');
directory = dir(directoryImages);
files = {directory.name};
contatore=0;
fprintf('OUTPUT on FILE: %s\n\n',percorsoFileOutput);
fprintf(FileCorrelazione,'%s\n\n',descrizione); %scrittura descrizioni

count=0;

for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
         
            count=count+1;
	    fprintf('\nCompute Photo %d <<%s>>\n',count,char(files(i)));
	    IMG=strcat(directoryImages,char(files(i)));
	    fprintf(FileCorrelazione, 'Compute Photo %d <<%s>>\n',count,char(files(i)));	
	    identificazioneCamera_resize(percorsoRP, IMG, char(files(i)), FileCorrelazione);
	    fprintf(FileCorrelazione, '\n\n');
    end
end
fclose(FileCorrelazione);
fprintf('FILE delle CORRELAZIONI REALIZZATO\n');




