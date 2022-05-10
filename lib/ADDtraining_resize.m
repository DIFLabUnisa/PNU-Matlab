function ADDtraining_resize(pathAbsApplicazione)

% ADDtraining_resize(pathAbsApplicazione)
%
% La funzione effettua il training utilizzando il resize. 
% La funzione effettua le correlazioni mancanti sul n-esimo ReferencePattern.
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%


% 1 1 => resize training 

pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TRAINING/', pathAbsApplicazione);

ADDtraining_testing(pathAbsApplicazione, pathAbsRP, pathAbsImg, 1, 1);
