function training_testingDimensioniLimitate(pathApplicazione, pathReferencePatterns, pathImmagini, dimensioni, training_testing)

% training_testingDimensioniLimitate(pathApplicazione, pathReferencePatterns, pathImmagini, dimensioni, training_testing)
%
% Vengono effettuate le correlazioni tra le immagini, 
% secondo i parametri utilizzati
% 
% Tutte le immagini di una specifica camera,
% vengono confrontate con tutte le alre camere,
% in termini di correlazione
%
% pathApplicazione e' la root della applicazione
% pathReferencePattern e' la cartella contenente i template delle camere
% pathReferencePatterns termina con il carattere /
% Esempio: pathReferencePatterns='/home/utente/APPLICAZIONE/REFERENCE PATTERN/'
% pathImmagini contiene la root delle immagini di training o di testing
% training_testing: training_testing=1 => training; training_testing=2 (o altro valore) => testing;
% dimensioni [512 512]
%
%
% Roscigno Gianluca - Lanzilli Giuseppe


n = getNumCameras(pathReferencePatterns);


directory = dir(pathImmagini);
files = {directory.name};


%Inizializzazioni
if (training_testing==1)
	out='train';
else
	out='test';
end;

nome='512x512';

nomeFileOutput=sprintf('%s/Correlazioni/%s_%s.PNU', pathApplicazione, out, nome);

fileOutput=fopen(nomeFileOutput,'wt');


if (length(files)-2)~=n
	fprintf('La cartella delle immagini contiene un numero di camere differenti rispetto al RP\n'); 
        %La cartella delle immagini contiene un numero di camere differenti rispetto al RP
	return;
end;

classe=0;

% per ogni cartella prendo ogni immagine e la confronto con gli n rp
for k = 1 : length(files) 
	 if directory(k).isdir 

	    nomeDir=char(files(k));

	    if (strcmp(nomeDir,'.')==1 || strcmp(nomeDir,'..')==1)
            	continue;
	    end;

        
        pathImagesAbs=sprintf('%s%s/', pathImmagini, nomeDir);
        
        if (training_testing ==1)
            numImg = getNumImgTrain();
        else
            numImg = getNumImgTest();
        end
        
	
        classe=classe+1;
        % i=classe; => Camera i-esima
	confrontoDimensioniLimitate(pathReferencePatterns, pathImagesAbs, numImg, fileOutput, classe, dimensioni);
            
    end

end
