function ADDtesting_crop(pathAbsApplicazione) 

% ADDtesting_crop(pathAbsApplicazione)
%
% La funzione effettua il testing utilizzando il ritaglio. 
% La funzione effettua le correlazioni mancanti sul n-esimo ReferencePattern.
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%



% 2 2 => cropped testing


pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TESTING/', pathAbsApplicazione);

ADDtraining_testing(pathAbsApplicazione, pathAbsRP, pathAbsImg, 2, 2);
