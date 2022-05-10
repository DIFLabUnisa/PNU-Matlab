function training_testingAdattivo(pathApplicazione, pathReferencePatterns, pathImmagini, resize_cropped, training_testing,db)

% training_testingAdattivo(pathApplicazione, pathReferencePatterns, pathImmagini, resize_cropped, training_testing,db)
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
% resize_cropped: 1 => resize; 2 (o altro valore) => cropped
% training_testing: 1 => training; 2 (o altro  valore) => testing
%
% Esempi:
%       1 1 => resize training
%       1 2 => resize, testing
%       2 1 => cropped training
%       2 2 => cropped testing
%
% Roscigno Gianluca - Lanzilli Giuseppe


n = getNumCameras(pathReferencePatterns);


directory = dir(pathImmagini);
files = {directory.name};


%Inizializzazioni
if (resize_cropped==1)
	nome='resize';
else
	nome='crop';
end;

if (training_testing==1)
	out='train';
else
	out='test';
end;


nomeFileOutput=sprintf('%s/Correlazioni/%s_%s.PNU', pathApplicazione, out, nome);

fileOutput=fopen(nomeFileOutput,'wt');


if (length(files)-2)~=n
	fprintf('La cartella delle immagini contiene un numero di camere differenti rispetto al RP\n'); 
        %La cartella delle immagini contiene un numero di camere differenti rispetto al RP
	%return;
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
	confrontoAdattivo(pathReferencePatterns, pathImagesAbs, numImg, fileOutput, classe, resize_cropped,db);
            
    end

end
