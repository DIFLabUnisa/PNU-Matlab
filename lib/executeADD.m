function executeADD(pathApplicazione)

% executeADD(pathAbsApplicazione)
%
% Vengono effettuati training e testing sulle immagini 
% contenute nel "pathAbsApplicazione" con il nuovo ReferencePattern
% Inoltre, vengono effettuate tutte le correlazioni mancanti.
%
% pathAbsApplicazione termina con /
%
% RoscignoGianluca - Lanzilli Giuseppe

% Riscrittura dei file per SVM


ADDtraining_resize(pathApplicazione); % 1 1 => resize training
ADDtesting_resize(pathApplicazione); % 1 2 => resize testing
ADDtraining_crop(pathApplicazione); % 2 1 => cropped training
ADDtesting_crop(pathApplicazione); % 2 2 => cropped testing


