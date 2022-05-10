function computeCorrelazioni_cropAdattivo(directoryImages, ReferencePattern, stringaPattern, percorsoFileOutput, descrizione,db)

% computeCorrelazioni_cropAdattivo(directoryImages, ReferencePattern, stringaPattern, percorsoFileOutput, descrizione,db)
%
% La funzione permette di effettuare la correlazione tra il "ReferencePattern"
% ed il rumore residuo delle immagini contenute nella cartella "directoryImages".
% Le correlazioni sono scritte nel file "percorsoFileOutput".
% Il file inizia con la "descrizione" indicata.
% "stringaPattern" contiene la stringa del pattern da anteporre ad ogni correlazione
% Se la dimensione dell'immagine non e' compatibile con il Reference Pattern, 
% quest'ultimo potrebbe essere tagliato (considerando la parte in alto a sinistra).
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


FileCorrelazione=fopen(percorsoFileOutput,'wt');
directory = dir(directoryImages);
files = {directory.name};
contatore=0;
fprintf('OUTPUT on FILE: %s\n',percorsoFileOutput);
fprintf(FileCorrelazione,'%s\n\n',descrizione); %scrittura descrizioni
temp='';
[righeRP, colonneRP, canaliRP] = size(ReferencePattern);


for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
                
        fprintf('Compute Photo %d <<%s>>   [utilizzo del CROP]\n',i-2,char(files(i)));
        img=imread(strcat(directoryImages,char(files(i))));
        [righe, colonne, canali] = size(img);

        t0=clock;
	t=cputime;
        [residual_noise]=getResidualNoiseAdattivo(img,db);
	tempoCPU = cputime-t; 
	tempoExec = etime(clock,t0);
           
        minRighe=min(righe, righeRP);
	minColonne=min(colonne, colonneRP);
	referencePatternTmp = ReferencePattern(1:minRighe, 1:minColonne, :); %cropped
	residual_noiseTmp = residual_noise(1:minRighe, 1:minColonne, :); %cropped
           
	
        result_corr=correlazione(referencePatternTmp, residual_noiseTmp);
        clear referencePatternTmp residual_noiseTmp;

        contatore=contatore+1;
      
       
        [corr1] = replaceSTR(sprintf('%g',result_corr(1)));
        [corr2] = replaceSTR(sprintf('%g',result_corr(2)));
        [corr3] = replaceSTR(sprintf('%g',result_corr(3)));
		
	fprintf(FileCorrelazione,'%s; RN(%s); %s; %s; %s\n', stringaPattern, char(files(i)), corr1, corr2, corr3);%scrittura nel file

	fprintf('     Tempo CPU (getResidualNoise): %g secondi\n',tempoCPU);
        fprintf('     Tempo Exec (getResidualNoise): %g secondi\n',tempoExec);
	fprintf('%s; RN(%s); %s; %s; %s\n', stringaPattern, char(files(i)), corr1, corr2, corr3);
	fprintf('Correlation Image %d WRITTEN on file.\n\n',i-2);
	    
        clear img residual_noise;
    end
end
fclose(FileCorrelazione);
fprintf('FILE delle CORRELAZIONI REALIZZATO\n\n');
