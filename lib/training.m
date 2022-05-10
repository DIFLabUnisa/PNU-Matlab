function training(pathAbsApplicazione, dimensioni)


% training(pathAbsApplicazione, dimensioni)
%
% La funzione effettua il training considerando la parte in alto a sinistra delle immagini,
% in accordo alle dimensioni utilizzate come parametro.. 
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%



pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TRAINING/', pathAbsApplicazione);

training_testingDimensioniLimitate(pathAbsApplicazione, pathAbsRP, pathAbsImg, dimensioni, 1);
