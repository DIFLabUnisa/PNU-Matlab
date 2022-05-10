function [corr] = correlazione(img, patt)
% Effettua la correlazione tra 2 immagini (matrici)
% [corr] = correlazione(img, patt)
% La funzione ci consente di effettuare la correlazione tra l'immagine e il pattern
% di riferimento. La correlazione è effetuata per ogni canale.

img=double(img);
patt=double(patt);

% controllo dimensione matrici: devono avere la stessa dimensione
if size(img) ~= size(patt)
    disp('Dimesioni matrici non corrispondenti');
    return
end

[r1,c1,nc1]=size(img);
[r2,c2,nc2]=size(patt);

if(r1~=r2 || c1~=c2 || nc1~=nc2)
	disp('Dimesioni matrici non corrispondenti');
end;

% determinazione del numero canali dell'immagine: RGB(3), scala di, grigi(1)
size_img = size(img);
[row,col] = size(size_img);
if(col == 2)
    nCanali = 1;
else
    nCanali = 3;
end
corr = zeros(1,nCanali); % vettore riga di nCanali
for canale = 1 : nCanali
    % media aritmetica pixel per pixel
    media_img = mean(mean(img(:,:,canale)));
    media_patt = mean(mean(patt(:,:,canale)));
    
    somma = 0;
    for i = 1 : size(img,1)
        for j = 1 : size(img,2)
            somma = somma + (img(i,j,canale) - media_img) * (patt(i,j,canale) - media_patt);
        end
    end
    
    somma1 = 0;
    somma2 = 0;
    for i = 1 : size(img, 1)
        for j = 1 : size(img, 2)
            somma1 = somma1 + (img(i,j,canale) - media_img)^2;
            somma2 = somma2 + (patt(i,j,canale) - media_patt)^2;
        end
    end
    den = sqrt(somma1) * sqrt(somma2); %denominatore
    corr(1,canale) = somma / den; %risultato
end
