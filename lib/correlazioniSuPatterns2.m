function correlazioniSuPatterns(percorsoDirectoryPatterns, percorsoImmaginiDaCorrelare, directoryOutput)
%correlazioniSuPatterns(directoryPatterns, percorsoImmaginiDaCorrelare, directoryOutput)
%pattern: referencePattern

directoryPatterns = dir(percorsoDirectoryPatterns);
files = {directoryPatterns.name};
%fprintf('%s\n',percorsoDirectoryPatterns);

for i = 1 : length(files)
    if ~directoryPatterns(i).isdir % escludo qualsiasi cartella, anche ./ ../
        fileRefPattern=char(files(i));
        fileRP=strcat(percorsoDirectoryPatterns,char(files(i)));
        load (fileRP);
        %caricato REFERENCE PATTERN
        
	
        nomePattern=strcat(' RN(',fileRefPattern);
        nomePattern=strcat(nomePattern,')');
	nomePattern=strrep(nomePattern,'.mat','');  
        fileRefPattern=strrep(fileRefPattern,'.mat','');
        
        
        nomeFile = strcat('Correlazione tra  ', nomePattern);
        nomeFile = strcat(nomeFile, ' e ');
        nomeFile=strcat(nomeFile, percorsoImmaginiDaCorrelare);
      
        
        nomeFile=strrep(nomeFile,'/','_');
        nomeFile=strrep(nomeFile,'.mat',' ');
        fileOutput=strcat(directoryOutput,nomeFile);
       
        %fprintf('Percorso Immagini da Correlare %s\n',percorsoImmaginiDaCorrelare);
        %fprintf('Reference pattern: %s\n',nomePattern); 
        %fprintf('Nome file: %s\n',nomeFile);
        fprintf('File Output: %s\n',fileOutput);
        
        scriptCorrelazioni2(percorsoImmaginiDaCorrelare, referencePattern, nomePattern, strcat(fileOutput,'.txt'), fileOutput);
	
        clear referencePattern;
    end
end
