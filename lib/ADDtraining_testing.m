function ADDtraining_testing(pathApplicazione, pathReferencePatterns, pathImmagini, resize_cropped, training_testing)

% ADD_training_testing(pathApplicazione, pathReferencePatterns, pathImmagini, resize_cropped, training_testing)
%
% Se una nuova camera e'aggiunta nel sistema, 
% si rieffettuano le correlazioni. 
% Presupposto: i referencePattern e le immagini devono essere presenti nel
% repository, infatti si classifica la camera n-esima,
% dove n e' il numero di immagini nel repository.
%
% Vengono effettuate le correlazioni mancanti tra le immagini, 
% secondo i parametri utilizzati.
% 
% Tutte le immagini di una specifica camera,
% vengono confrontate con tutte le alre camere,
% in termini di correlazione (quelle gia' presenti non sono calcolate)
%
% pathApplicazione e' la root della applicazione
% pathReferencePattern e' la cartella contenente i template delle camere
% pathReferencePatterns termina con il carattere /
% Esempio: pathReferencePatterns='/home/utente/APPLICAZIONE/REFERENCE PATTERN/'
% pathImmagini contiene la root delle immagini di training o di testing
% resize_cropped: 1 => resize; 2 (o altro valore) => cropped
% training_testing: 1 => training; 2 (o altro  valore) => testing
%
% Esempi:
%       1 1 => resize training
%       1 2 => resize, testing
%       2 1 => cropped training
%       2 2 => cropped testing
%
% Roscigno Gianluca - Lanzilli Giuseppe


n = getNumCameras(pathReferencePatterns);


directory = dir(pathImmagini);
files = {directory.name};

%Inizializzazioni
if (resize_cropped==1)
	nome='resize';
else
	nome='crop';
end;

if (training_testing==1)
	out='train';
else
	out='test';
end;


nomeFileTmp = sprintf('%sCorrelazioni/tmp_corr.PNU', pathApplicazione);
nomeFileInput = sprintf('%sCorrelazioni/%s_%s.PNU', pathApplicazione, out, nome);
nomeNuovoFileOutput = sprintf('%sCorrelazioni/NUOVO_%s_%s.PNU', pathApplicazione, out, nome);

fileTmp = fopen(nomeFileTmp,'wt');
fileInput=fopen(nomeFileInput,'rt');
fileOutput=fopen(nomeNuovoFileOutput,'wt');




if (length(files)-2)~=n
	fprintf('La cartella delle immagini contiene un numero di camere differenti rispetto al RP\n'); 
	return;
end;

addCorr(pathReferencePatterns, pathImmagini, resize_cropped, training_testing, fileTmp); %aggiunte le <<colonne>> delle correlazioni mancanti.


fileTmp = fopen(nomeFileTmp,'rt');

line=fgets(fileInput);
line(length(line))='';


while line ~= -1
    
    %fprintf('%s',line);
    
    
    % aggiungere le nuove correlazioni
    nuoveCorrelazioni = fgets(fileTmp);
    nuoveCorrelazioni(length(nuoveCorrelazioni))='';
   
    lineOutput = sprintf('%s %s', line, nuoveCorrelazioni);
    fprintf(fileOutput, '%s\n', lineOutput);
  
    
    line=fgets(fileInput);    
    line(length(line))='';
end


   if training_testing ==1
       numImg = getNumImgTrain();
   else
       numImg = getNumImgTest();
   end
   
   %flcose(fileInput);
   delete(nomeFileInput);
   delete(nomeFileTmp);
   movefile(nomeNuovoFileOutput, nomeFileInput);
   

   % n=classe; => Camera n-esima
   pathImagesAbs=sprintf('%s%d/', pathImmagini, n);
   
   confronto(pathReferencePatterns, pathImagesAbs, numImg, fileOutput, n, resize_cropped);
