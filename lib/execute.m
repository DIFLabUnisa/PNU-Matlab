function execute(pathApplicazione)

% execute(pathAbsApplicazione)
%
% Vengono effettuati training e testing sulle immagini 
% contenute nel "pathAbsApplicazione".
% Inoltre, vengono effettuate tutte le correlazioni,
% nel formato per la creazione dei grafici,
% nonche' della ricerca della soglia ottimale.
% Si considera sia ridimensionamento che cropped.
%
% pathAbsApplicazione termina con /
%
% RoscignoGianluca - Lanzilli Giuseppe

% Scrittura dei file per SVM
training_resize(pathApplicazione); % 1 1 => resize training
testing_resize(pathApplicazione); % 1 2 => resize testing
training_crop(pathApplicazione); % 2 1 => cropped training
testing_crop(pathApplicazione); % 2 2 => cropped testing

% Scrittura dei file delle correlazioni
correlazioniCamere(strcat(pathApplicazione,'IMMAGINI/'), strcat(pathApplicazione,'Correlazioni/TUTTE_LE_CORRELAZIONI/'), strcat(pathApplicazione,'REFERENCE PATTERN/'));
