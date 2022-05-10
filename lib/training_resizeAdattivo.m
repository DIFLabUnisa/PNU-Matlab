function training_resizeAdattivo(pathAbsApplicazione, db)

% training_resizeAdattivo(pathAbsApplicazione,db)
%
% La funzione effettua il training utilizzando il resize. 
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%


% 1 1 => resize training 

pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TRAINING/', pathAbsApplicazione);

training_testingAdattivo(pathAbsApplicazione, pathAbsRP, pathAbsImg, 1, 1,db);
