function ADDtraining_crop(pathAbsApplicazione)


% ADDtraining_crop(pathAbsApplicazione)
%
% La funzione effettua il training utilizzando il ritaglio. 
% La funzione effettua le correlazioni mancanti sul n-esimo ReferencePattern.
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%

% 2 1 => cropped training


pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TRAINING/', pathAbsApplicazione);

ADDtraining_testing(pathAbsApplicazione, pathAbsRP, pathAbsImg, 2, 1);
