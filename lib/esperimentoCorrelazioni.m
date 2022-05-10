function esperimentoCorrelazioni(referencePattern, percorsoImmagine, n, m, percorsoFileOutput, riga, colonna)
% esperimentoCorrelazioni(referencePattern, percorsoImmagine, n, m, percorsoFileOutput, riga, colonna)

[righe,colonne,dim]=size(referencePattern);

descrizione='';

Immagine = imread(percorsoImmagine);
RN_Img = getResidualNoise(Immagine);
B = RN_Img(riga:riga+n, colonna:colonna+m,:);

FileCorrelazione=fopen(percorsoFileOutput,'wt');
fprintf('OUTPUT on FILE: %s\n',percorsoFileOutput);
fprintf(FileCorrelazione,'%s\n\n',descrizione); %scrittura descrizioni

count=1;

for i=1:(righe-n);
	for j=1:(colonne-m);
		A = referencePattern(i:i+n,j:j+m,:);
		[corr] = correlazione(A,B);	
		fprintf('Iterazione %d\n',count);
		count=count+1;
		fprintf(FileCorrelazione,'Left-Top: (%d,%d) => %g %g %g\n', i,j,corr(1),corr(2),corr(3)); 
	end
end
fclose(FileCorrelazione);
fprintf('ESPERIMENTO REALIZZATO\n');
