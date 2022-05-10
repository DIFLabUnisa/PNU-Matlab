function testing_crop(pathAbsApplicazione) 

% testing_crop(pathAbsApplicazione)
%
% La funzione effettua il testing utilizzando il ritaglio. 
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%



% 2 2 => cropped testing


pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TESTING/', pathAbsApplicazione);

training_testing(pathAbsApplicazione, pathAbsRP, pathAbsImg, 2, 2);
