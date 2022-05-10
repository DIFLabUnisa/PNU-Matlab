function addCorr(pathReferencePatterns, pathImmagini, resize_cropped, training_testing, fileOutput)

% addCorr(pathReferencePatterns, pathImmagini, resize_cropped, training_testing, fileOutput)
% 
% La funzione consente di effettuare le correlazioni mancanti relative al
% nuovo referencePattern
%
% pathReferencePattern e' la cartella contenente i template delle camere
% Esempio: pathReferencePatterns='/home/utente/APPLICAZIONE/REFERENCE PATTERN/'
% pathImmagini contiene la root delle immagini di training o di testing
% resize_cropped: 1 => resize; 2 (o altro valore) => cropped
% training_testing: 1 => training; 2 (o altro valore) => testing
% fileOutput e' il descrittore del file in cui inserire le correlazioni
%
% Roscigno Gianluca - Lanzilli Giuseppe



n = getNumCameras(pathReferencePatterns);


directory = dir(pathImmagini);
files = {directory.name};


if (length(files)-2)~=n
	fprintf('La cartella delle immagini contiene un numero di camere differenti rispetto al RP\n');
        % La cartella delle immagini contiene un numero di camere differenti rispetto al RP
	return;
end;

classe=0;

dirNuova=sprintf('%d',n);

% per ogni cartella (tranne la n-esima) prendo ogni immagine e la confronto con gli  rp n-esimo
for k = 1 : (length(files)) 

	 if directory(k).isdir 

	    nomeDir=char(files(k));

	    if ( strcmp(nomeDir,'.')==1 || strcmp(nomeDir,'..')==1 || strcmp(nomeDir,dirNuova) )
            	continue;
	    end;


        
        pathImagesAbs=sprintf('%s%s/', pathImmagini, nomeDir);
        
        if training_testing == 1
            numImg = getNumImgTrain();
        else
            numImg = getNumImgTest();
        end
        
	
        classe=classe+1;
        % i=classe; => Camera i-esima
	confrontoSingoloRP(pathReferencePatterns, pathImagesAbs, numImg, fileOutput, classe, resize_cropped);
            
    end

end
