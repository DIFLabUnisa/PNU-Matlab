function correlazioniCamereDimensioniLimitate(directoryImages, percorsoOutput, percorsoRP, dimensioni)

% correlazioniCamereDimensioniLimitate(directoryImages, percorsoOutput, percorsoRP, dimensioni)
% Esempio:
%           correlazioniCamere('/home/roscignofamily/Scrivania/APPLICAZIONE/IMMAGINI/', '/home/roscignofamily/Scrivania/APPLICAZIONE/Correlazioni/TUTTE_LE_CORRELAZIONI/', '/home/roscignofamily/Scrivania/APPLICAZIONE/REFERENCE PATTERN/', [512 512]);
%
%
% Autori: Lanzilli Giuseppe- Roscigno Gianluca


directory = dir(percorsoRP);
filesRP = {directory.name};


for i = 1 : length(filesRP) % Per ogni reference Pattern

    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
        

		dirName=char(filesRP(i));
		if(strcmp(dirName,'.')==1 || strcmp(dirName,'..')==1)
			continue;
		end;

		nomeRP = strrep(char(filesRP(i)),'.mat','');
		nomeRP=getRPFormalName(nomeRP);

		fileRP=strcat(percorsoRP, char(filesRP(i)));

		load (fileRP); % carico referencePattern; 
       
      		fprintf('CORRELAZIONI "%s":\n\n', nomeRP);
		correlaRPDimensioniLimitate(referencePattern, nomeRP, directoryImages, percorsoOutput, dimensioni);		            
		fprintf('\n\n\n');
    end
end
