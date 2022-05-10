function testing_crop(pathAbsApplicazione, dimensioni) 

% testing_crop(pathAbsApplicazione)
%
% La funzione effettua il testing considerando la parte in alto a sinistra delle immagini,
% in accordo alle dimensioni utilizzate come parametro.
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%


pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TESTING/', pathAbsApplicazione);

training_testingDimensioniLimitate(pathAbsApplicazione, pathAbsRP, pathAbsImg, dimensioni, 2);
