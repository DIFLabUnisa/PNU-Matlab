function correlaRP(referencePattern, nomeRP, directoryImages, percorsoOutput)

% correlaRP(referencePattern, nomeRP, directoryImages, percorsoOutput)
% 
% La funzione, dato il reference pattern, effettua le correlazioni
% con la cartella directoryImages e le memorizza in percorsoOutput.
% Le correlazioni sono sia con ridimensionamento immagine, sia con ritaglio.
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
        
        descrizioneCrop = sprintf('Correlazione tra  %s e %s (Utilizzo del CROP)', nomeRP, strrep(dirImgs,'/','_'));
        descrizioneResize = sprintf('Correlazione tra  %s e %s (Utilizzo del RESIZE)', nomeRP, strrep(dirImgs,'/','_'));
        
        percorsoFileOutputCrop = sprintf('%sCROP/%s.txt', percorsoOutput, descrizioneCrop);
        
        percorsoFileOutputResize = sprintf('%sRESIZE/%s.txt', percorsoOutput, descrizioneResize);
        
        
       computeCorrelazioni_crop(dirImgs, referencePattern, nomeRP, percorsoFileOutputCrop, descrizioneCrop);
       computeCorrelazioni_resize(dirImgs, referencePattern, nomeRP, percorsoFileOutputResize, descrizioneResize);	         
		
    end
end


	
