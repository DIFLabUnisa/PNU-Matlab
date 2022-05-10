function compute(nomeFileInput, nomeFileOutput, ct1, ct2, ct3, toll)


	input=fopen(nomeFileInput, 'rt');

	output=fopen(nomeFileOutput, 'wt');
	
	countR=0;
    countG=0; 
    countB=0;
    numRighe=0;

    while 1,
    
	buff = fgets(input);
    
    if buff==-1
        break;
    end
    
    part = regexp(buff,' ','split');

   
    if size(part,2)==1 %riga vuota
        continue; 
    end
    
    if strcmp(buff,'')==1 %stringhe identiche
		continue;
    end
		

		numRighe=numRighe+1;
		fprintf('Compute row: %d %s\n', numRighe, buff);
        
        c1=str2double(part(3));
        c2=str2double(part(4));
        c3=str2double(part(5));

		if abs(ct1-c1)<=toll,
			countR=countR+1;
        end

		if abs(ct2-c2)<=toll,
			countG=countG+1;
        end

		if abs(ct3-c3)<=toll,
			countB=countB+1;
        end
        
    end
    
	fclose(input);

    fprintf('OUTPUT:\nTolleranza = %f\n\nNumero righe = %d\n\nCorrelazione Totale = %f %f %f\n\nNumero correlazioni simili canale Rosso = %d\n\nNumero correlazioni simili canale Verde = %d\n\nNumero correlazioni simili canale Blu = %d\n\n', toll, numRighe, ct1, ct2, ct3, countR, countG, countB);
    fprintf(output, 'OUTPUT:\nTolleranza = %f\n\nNumero righe = %d\n\nCorrelazione Totale = %f %f %f\n\nNumero correlazioni simili canale Rosso = %d\n\nNumero correlazioni simili canale Verde = %d\n\nNumero correlazioni simili canale Blu = %d\n\n', toll, numRighe, ct1, ct2, ct3, countR, countG, countB);
	fclose(output);

