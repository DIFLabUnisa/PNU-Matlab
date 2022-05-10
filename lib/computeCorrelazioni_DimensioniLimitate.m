function computeCorrelazioni_DimensioniLimitate(directoryImages, referencePattern, stringaPattern, percorsoFileOutput, descrizione, dimensioni)

% computeCorrelazioni_DimensioniLimitate(directoryImages, referencePattern, stringaPattern, percorsoFileOutput, descrizione, dimensioni)
%
% La funzione permette di effettuare la correlazione tra il "ReferencePattern"
% ed il rumore residuo delle immagini contenute nella cartella "directoryImages".
% Le correlazioni sono scritte nel file "percorsoFileOutput".
% Il file inizia con la "descrizione" indicata.
% "stringaPattern" contiene la stringa del pattern da anteporre ad ogni correlazione
% Se la dimensione dell'immagine non e' compatibile con il Reference Pattern, 
% La correlazione è calcolata sulla parte in alto a sinistra di 'dimensioni'.
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


FileCorrelazione=fopen(percorsoFileOutput,'wt');
directory = dir(directoryImages);
files = {directory.name};
contatore=0;
fprintf('OUTPUT on FILE: %s\n',percorsoFileOutput);
fprintf(FileCorrelazione,'%s\n\n',descrizione); %scrittura descrizioni
temp='';
[righeRP, colonneRP, canaliRP] = size(referencePattern);


for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
                
        fprintf('Compute Photo %d <<%s>>   [%dx%d]\n',i-2,char(files(i)),dimensioni(1), dimensioni(2));
        img1=imread(strcat(directoryImages,char(files(i))));
        img=img1(1:dimensioni(1), 1:dimensioni(2), :);
        
        
        [righe, colonne, canali] = size(img);

        t0=clock;
	t=cputime;
        [residual_noise]=getResidualNoise(img);
	tempoCPU = cputime-t; 
	tempoExec = etime(clock,t0);
           
 
   
        result_corr=correlazione(referencePattern, residual_noise);

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
