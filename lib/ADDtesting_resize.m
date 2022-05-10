function ADDtesting_resize(pathAbsApplicazione) 

% ADDtesting_resize(pathAbsApplicazione)
%
% La funzione effettua il testing utilizzando il resize. 
% La funzione effettua le correlazioni mancanti sul n-esimo ReferencePattern.
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%


% 1 2 => resize, testing

pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TESTING/', pathAbsApplicazione);

ADDtraining_testing(pathAbsApplicazione, pathAbsRP, pathAbsImg, 1, 2);
