function correlaRPDimensioniLimitate(referencePattern, nomeRP, directoryImages, percorsoOutput, dimensioni)

% correlaRPDimensioniLimitate(referencePattern, nomeRP, directoryImages, percorsoOutput, dimensioni)
% 
% La funzione, dato il reference pattern, effettua le correlazioni
% con la cartella directoryImages e le memorizza in percorsoOutput.
% Le correlazioni sono effettuate considerando la parte in alto a sinistra di 'dimensioni'
%
% Roscigno Gianluca - Lanzilli Giuseppe


directory = dir(directoryImages);
files = {directory.name};


for i = 1 : length(files) % Per ogni directory in "directoryImages"

    if directory(i).isdir
        
        nomeDir = char(files(i));
        
        if ( strcmp(nomeDir,'.')==1 || strcmp(nomeDir,'..')==1 )
            	continue;
	    end;
        
        
        dirImgs = sprintf('%s%s/', directoryImages, nomeDir);
        
        descrizioneDimLim = sprintf('Correlazione tra  %s e %s (%dx%d)', nomeRP, strrep(dirImgs,'/','_'), dimensioni(1), dimensioni(2));
	    percorsoFileOutputDimLim = sprintf('%sDIM_LIM/%s.txt', percorsoOutput, descrizioneDimLim);      

       computeCorrelazioni_DimensioniLimitate(dirImgs, referencePattern, nomeRP, percorsoFileOutputDimLim, descrizioneDimLim, dimensioni);
     	         
		
    end
end


	
