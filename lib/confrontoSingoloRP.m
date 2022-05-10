function confrontoSingoloRP(pathReferencePatterns, pathImages, numImg, fileOutput, classe, resize_cropped)

% confrontoSingoloRP(pathReferencePatterns, pathImages, numImg, fileOutput, classe, resize_cropped)
%
% Ogni immagine nella cartella la confronto con tutti reference patterns
% pathReferencePattern e' la cartella contenente i template delle camere
% pathReferencePatterns termina con il carattere /
% Esempio: pathReferencePatterns='/home/utente/APPLICAZIONE/REFERENCE PATTERN/'
% pathImages contiene la root delle immagini di training o di testing
% numImg e' il numero di immagini da considerare
% fileOutput e' il descrittore del file in cui inserire le correlazioni
% classe rappresenta la camera in esame
% resize_cropped: 1 => resize; 2 (o altro valore) => cropped
%
% Roscigno Gianluca - Lanzilli Giuseppe


directory = dir(pathImages);
files = {directory.name};


str_resize_cropped='';

if(resize_cropped==1)
	str_resize_cropped='(con RESIZE)'; 
else
	str_resize_cropped='(con CROP)'; 
end


fprintf('\nCartella Immagini <<%s>> CLASSE %d  %s:\n', pathImages, classe, str_resize_cropped);


for j=1:length(files)
    
     if j>(numImg+2)
		break;
     end;
    
    nomeFile=char(files(j));
    
    
    n = getNumCameras(pathReferencePatterns);

    
    if ~directory(j).isdir % escludo qualsiasi cartella, anche ./ ../
        
	line='';
       
        % Sto elaborando il file "nomeFile"
        fprintf('Sto elaborando l''immagine <<%s%s>> Classe %d\n', pathImages, nomeFile, classe);
        
        
	immagine=imread(strcat(pathImages,nomeFile));
	[righe, colonne, canali] = size(immagine);
        
        %fprintf('OUTPUT FILTRO\n'); 
	[residual_noise]=getResidualNoise(immagine); % Applicazione filtro di denoising
	clear immagine;	
    
	directoryRP = dir(pathReferencePatterns);
	filesRP = {directoryRP.name};

	count=0;
        
        %fprintf('Correlazioni RN(%s) con RP(%d): ', nomeFile, n); 
        for i=1:(n+2);

	    dirName=char(filesRP(i));
	    if(strcmp(dirName,'.')==1 || strcmp(dirName,'..')==1)
			continue;
	    end;
 	
            count=count+3;
            
            if(i==(n+2)) 
            
		
		stringaPattern=getRPFormalName(char(filesRP(i)));
                fprintf('Correlazioni RN(%s) con %s\n', nomeFile, stringaPattern);

                fileRP=strcat(pathReferencePatterns, char(filesRP(i)));
                load (fileRP); % carico referencePattern;
                
                [righeRP, colonneRP, canaliRP] = size(referencePattern);
                result_corr=[0 0 0];
            
               
	        minRighe=min(righe, righeRP);
	        minColonne=min(colonne, colonneRP);


	       if(resize_cropped==1)
                        referencePatternTmp = imresize(referencePattern, [minRighe minColonne]); %resize
			residual_noiseTmp = imresize(residual_noise, [minRighe minColonne]); %resize
               else
			referencePatternTmp = referencePattern(1:minRighe, 1:minColonne, :); %cropped
			residual_noiseTmp = residual_noise(1:minRighe, 1:minColonne, :); %cropped
               end
	
               result_corr=correlazione(referencePatternTmp, residual_noiseTmp);
         

               %fprintf('.');
	       currResult=sprintf('%d:%g %d:%g %d:%g',(count-2), result_corr(1), (count-1), result_corr(2), (count), result_corr(3));
               
           
               line=strcat(line,currResult);
            
               clear referencePatternTmp residual_noiseTmp;
            
               end; %Fine <<if(i==(n+2))>>
            
         end; %Fine scansione RP per l'immagine (Ho correlato il rumore residuo dell'immagine j-esima con tutti i reference patterns)
        
        %scrittura nel file di output
	fprintf(fileOutput, '%s\n', line); %scrittura nel corrispondente file
        fprintf('\n');
    end; %End if
    
    fprintf('\n');
end; %fine scansione immagini
fprintf('\n');
