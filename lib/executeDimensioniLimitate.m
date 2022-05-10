function executeDimensioniLimitate(pathApplicazione, dimensioni)

% executeDimensioniLimitate(pathAbsApplicazione, dimensioni)
%
% Vengono effettuati training e testing sulle immagini 
% contenute nel "pathAbsApplicazione".
% Inoltre, vengono effettuate tutte le correlazioni,
% nel formato per la creazione dei grafici,
% nonche' della ricerca della soglia ottimale.
% Si considera solo la parte in alto a sinistra di 'dimensioni'
% (Esempio: 512x512)
%
% pathAbsApplicazione termina con /
%
% RoscignoGianluca - Lanzilli Giuseppe

% dimensioni=[512 512];

% Scrittura dei file per SVM
training(pathApplicazione, dimensioni); 
testing(pathApplicazione, dimensioni); 

% Scrittura dei file delle correlazioni
correlazioniCamereDimensioniLimitate(strcat(pathApplicazione,'IMMAGINI/'), strcat(pathApplicazione,'Correlazioni/TUTTE_LE_CORRELAZIONI/'), strcat(pathApplicazione,'REFERENCE PATTERN/'), dimensioni);
