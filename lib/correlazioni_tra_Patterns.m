function correlazioni_to_tra_Patterns(percorsoDirectory)
fileResize = fopen(strcat(percorsoDirectory,'train_resize.PNU'),'wt');
fileCrop = fopen(strcat(percorsoDirectory,'train_crop.PNU'),'wt');
percorsoDirectoryPatterns=strcat(percorsoDirectory,'REFERENCE PATTERN/');
directoryPatterns = dir(percorsoDirectoryPatterns);
files = {directoryPatterns.name};


count=0;
id=1;
for i = 1 : length(files)
    if ~directoryPatterns(i).isdir % escludo qualsiasi cartella, anche ./ ../
        fileRefPattern=char(files(i));
        fileRP=strcat(percorsoDirectoryPatterns,char(files(i)));
        load (fileRP);
        %caricato REFERENCE PATTERN
        referencePatternA=referencePattern;
count=0;
	fprintf(fileCrop,'%d ',id);
	fprintf(fileResize,'%d ',id);
	id=id+1;

directoryPatterns2 = dir(percorsoDirectoryPatterns);
files2 = {directoryPatterns2.name};

        for j = 1 : length(files2)
    		if ~directoryPatterns2(j).isdir % escludo qualsiasi cartella, anche ./ ../
        	fileRefPattern=char(files2(j));
        	fileRP=strcat(percorsoDirectoryPatterns,char(files2(j)));
        	load (fileRP);
        	%caricato REFERENCE PATTERN
		referencePatternB=referencePattern;
		
 
           [righeRPA, colonneRPA, canaliRPA] = size(referencePatternA);
           [righeRPB, colonneRPB, canaliRPB] = size(referencePatternB);
                       
	    minRighe=min(righeRPA, righeRPB);
	    minColonne=min(colonneRPA, colonneRPB);
            referencePatternTmpA = imresize(referencePatternA, [minRighe minColonne]); %resize
	    referencePatternTmpB = imresize(referencePatternB, [minRighe minColonne]); %resize	


	    count=count+3;
			
            result_corr=correlazione(referencePatternTmpA, referencePatternTmpB);
	    currResult=sprintf(' %d:%g %d:%g %d:%g',(count-2), result_corr(1), (count-1), result_corr(2), (count), result_corr(3));
            fprintf(fileResize,currResult);
	     

             referencePatternTmpA = referencePatternA(1:minRighe, 1:minColonne, :); %cropped
	     referencePatternTmpB = referencePatternB(1:minRighe, 1:minColonne, :); %cropped
	
            result_corr=correlazione(referencePatternTmpA, referencePatternTmpB);
            currResult=sprintf(' %d:%g %d:%g %d:%g',(count-2), result_corr(1), (count-1), result_corr(2), (count), result_corr(3));
            fprintf(fileCrop,currResult);
	         			
    end
end
fprintf(fileCrop,'\n');
fprintf(fileResize,'\n');
    end
end
