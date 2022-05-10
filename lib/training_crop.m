function training_crop(pathAbsApplicazione)


% training_crop(pathAbsApplicazione)
%
% La funzione effettua il training utilizzando il ritaglio. 
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%

% 2 1 => cropped training


pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TRAINING/', pathAbsApplicazione);

training_testing(pathAbsApplicazione, pathAbsRP, pathAbsImg, 2, 1);