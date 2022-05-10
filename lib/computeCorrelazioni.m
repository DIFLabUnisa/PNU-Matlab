function computeCorrelazioni(directoryImages, ReferencePattern, stringaPattern, percorsoFileOutput, descrizione)

% computeCorrelazioni(directoryImages, ReferencePattern, stringaPattern, percorsoFileOutput, descrizione)
%
% La funzione permette di effettuare la correlazione tra il "ReferencePattern"
% ed il rumore residuo delle immagini contenute nella cartella "directoryImages".
% Le correlazioni sono scritte nel file "percorsoFileOutput".
% Il file inizia con la "descrizione" indicata.
% "stringaPattern" contiene la stringa del pattern da anteporre ad ogni correlazione
%
% Autori: Lanzilli Giuseppe- Roscigno Gianluca

FileCorrelazione=fopen(percorsoFileOutput,'wt');
directory = dir(directoryImages);
files = {directory.name};
contatore=0;
fprintf('OUTPUT on FILE: %s\n',percorsoFileOutput);
fprintf(FileCorrelazione,'%s\n\n',descrizione); %scrittura descrizioni


for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
            fprintf('Compute Photo %d <<%s>>\n',i-2,char(files(i)));
            img=imread(strcat(directoryImages,char(files(i))));

	    %tic; %azzero il cronometro (tic starts a stopwatch timer in seconds).
            t=cputime();
	    [residual_noise]=getResidualNoise(img);
	    tempo=cputime()-t;
	    %tempo=toc;  % toc prints the elapsed time since tic was used in seconds.


            result_corr=correlazione(ReferencePattern,residual_noise);
	    contatore=contatore+1;
        
       
            [corr1] = replaceSTR(sprintf('%g',result_corr(1)));
            [corr2] = replaceSTR(sprintf('%g',result_corr(2)));
            [corr3] = replaceSTR(sprintf('%g',result_corr(3)));
        
            fprintf(FileCorrelazione,'%s; RN(%s); %s; %s; %s\n',stringaPattern, char(files(i)), corr1, corr2, corr3);
            
            %fprintf(FileCorrelazione,'%s; RN(%s); %g; %g; %g\n',stringaPattern, char(files(i)),result_corr(1),result_corr(2),result_corr(3)); 
	    %fprintf(FileCorrelazione,'%s RN(%s) %g %g %g\n',stringaPattern, char(files(i)),result_corr(1),result_corr(2),result_corr(3));
		%scrittura nel file
	    fprintf('Tempo (getResidualNoise): %g secondi\n',tempo);
	    fprintf('Correlation Image %d WRITTEN on file.\n\n',i-2);
	    
            clear img residual_noise;
    end
end
fclose(FileCorrelazione);
fprintf('FILE delle CORRELAZIONI REALIZZATO\n');
