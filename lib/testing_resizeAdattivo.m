function testing_resizeAdattivo(pathAbsApplicazione,db) 

% testing_resizeAdattivo(pathAbsApplicazione,db)
%
% La funzione effettua il testing utilizzando il resize. 
%
% pathAbsApplicazione è la root della applicazione 
% Esempio: pathAbsApplicazione=/'home/roscignofamily/Scrivania/APPLICAZIONE/';
%


% 1 2 => resize, testing

pathAbsRP=sprintf('%sREFERENCE PATTERN/', pathAbsApplicazione);
pathAbsImg=sprintf('%sIMMAGINI_TESTING/', pathAbsApplicazione);

training_testingAdattivo(pathAbsApplicazione, pathAbsRP, pathAbsImg, 1, 2,db);
