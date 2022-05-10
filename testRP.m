function testRP(pathApplicazione, pathReferencePatterns)

% testRP(pathApplicazione, pathReferencePatterns)
%
% Esempio: testRP('/home/if/CONDIVISIONE/if/APPLICAZIONE/', '/home/if/CONDIVISIONE/if/APPLICAZIONE/REFERENCE PATTERN/');
%
% La funzione correla i reference patterns (templates) tra di loro,
% utilizzando il resize ed il cropped.
% L'output si trova nel file <<pathApplicazione/Correlazioni/CORRELAZIONI_RP_CROP.PNU>>
% e nel file  <<pathApplicazione/Correlazioni/CORRELAZIONI_RP_RESIZE.PNU>>
%
% Roscigno Gianluca - Lanzilli Giuseppe



directoryRP = dir(pathReferencePatterns);
filesRP = {directoryRP.name};


nomeFileOutputCrop=sprintf('%s/Correlazioni/CORRELAZIONI_RP_CROP.PNU', pathApplicazione);
fileOutputCrop=fopen(nomeFileOutputCrop,'wt');

nomeFileOutputResize=sprintf('%s/Correlazioni/CORRELAZIONI_RP_RESIZE.PNU', pathApplicazione);
fileOutputResize=fopen(nomeFileOutputResize,'wt');


classe=0;
count=0;

% Ogni reference patterns e' confrontato con gli altri reference patterns
for i = 1 : length(filesRP) 
	 if ~directoryRP(i).isdir % escludo qualsiasi directory, anche le directory . e ..

	    count=0;
	    classe=classe+1;
            % i=classe; => Camera i-esima (REFERENCE PATTERN i-esimo)

	    lineOutCrop=sprintf('%d:', classe);
	    lineOutResize=sprintf('%d:', classe);

	    nomeRP=strcat(pathReferencePatterns, char(filesRP(i)));
	    load (nomeRP);
	    referencePatternI = referencePattern;
	    [rI, cI, ncI] = size(referencePatternI);

	    directoryRP_bak = dir(pathReferencePatterns);
	    filesRP_bak = {directoryRP_bak.name};

	    for j = 1 : length(filesRP_bak) 
		 if ~directoryRP_bak(j).isdir % escludo qualsiasi directory, anche le directory '.' e '..'

			count=count+3;

	   	 	nomeRPtmp=strcat(pathReferencePatterns, char(filesRP_bak(j)));
	    	 	load (nomeRPtmp);
	         	referencePatternJ = referencePattern;
			[rJ, cJ, ncJ] = size(referencePatternJ);

			minRighe = min(rI, rJ);
			minColonne = min(cI, cJ);
	
		
			referencePatternCropI=referencePatternI(1:minRighe, 1:minColonne, :);
			referencePatternResizeI=imresize(referencePatternI, [minRighe minColonne]);
			referencePatternCropJ=referencePatternJ(1:minRighe, 1:minColonne, :);
			referencePatternResizeJ=imresize(referencePatternJ, [minRighe minColonne]);

			[corrCrop] = correlazione(referencePatternCropI, referencePatternCropJ);
			lineTmpCrop=sprintf(' %d:%g %d:%g %d:%g', (count-2), corrCrop(1), (count-1), corrCrop(2), (count), corrCrop(3));
			lineOutCrop=strcat(lineOutCrop, lineTmpCrop);


			[corrResize] = correlazione(referencePatternResizeI, referencePatternResizeJ);
			lineTmpResize=sprintf(' %d:%g %d:%g %d:%g', (count-2), corrResize(1), (count-1), corrResize(2), (count), corrResize(3));
			lineOutResize=strcat(lineOutResize, lineTmpResize);

    		end
	     end
	   
	     fprintf(fileOutputCrop, '%s\n', lineOutCrop);
	     fprintf(fileOutputResize, '%s\n', lineOutResize);
    end

end


fclose(fileOutputCrop);
fclose(fileOutputResize);
