function computeReferencePattern3(pathApplicazione, numImg, db_family)

% computeReferencePattern2(pathApplicazione, numImg, db_family)
%
% La funzione prende le immagini delle camere contenute nella cartella di enrollment
% e calcola il rispettivo camera reference pattern.
% Quest'ultimo e' memorizzato nella opportuna cartella.
%
% Roscigno Gianluca - Lanzilli Giuseppe


dirImgEnr = strcat(pathApplicazione, 'IMMAGINI_ENROLLMENT/');
dirRP = strcat(pathApplicazione, 'REFERENCE PATTERN/');

directory = dir(dirImgEnr);
files = {directory.name};

classe=0;

% per ogni cartella calcolo il Camera Reference Pattern e lo memorizzo
for k = 1 : length(files) 
	 if directory(k).isdir 

	    nomeDir=char(files(k));

	    if (strcmp(nomeDir,'.')==1 || strcmp(nomeDir,'..')==1)
            	continue;
	    end;

           classe=classe+1;
           % i=classe; => Camera i-esima

	   fprintf('Calcolo Reference Pattern %s:\n', nomeDir)
	   [referencePattern]=mediaReferencePattern3(strcat(dirImgEnr, strcat(nomeDir, '/')), numImg, db_family); 
	   nomeRP = sprintf('%d_REFERENCE_PATTERN_%s', classe, strrep(nomeDir, ' ', '_'));
           save (strcat(dirRP, nomeRP),'referencePattern');      
    end

end
