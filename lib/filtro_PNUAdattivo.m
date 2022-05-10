function [imgFiltrata]=filtro_PNUAdattivo(img,sigma0,db_family)

% La funzione implementa il filtro PNU
% [imgFiltrata]=filtro_PNUAdattivo(img, sigma0, db_family);
% sigma0 e' un valore sperimentale (solitamente 5 oppure 2) utilizzato per il calcolo dei
% coefficienti H, V e D di denoising. Il parametro sigma0 e' la varianza della stima
% dell'errore.
% db_family, esempio: 'db2', 'db4', 'db8'
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

size_img=size(img);
[row,col]=size(size_img);
if(col == 2)
    nCanali=1;
else
    nCanali=3;
end

% Inizio
% Viene eseguito l'algoritmo per ogni canale dell'immagine
for num_Canale=1:nCanali
    imgCanaleNoise=img(:,:,num_Canale); % otteniamo l'immagine per il canale num_Canale
    [C,S]=wavedec2(imgCanaleNoise,4,db_family); % wavedec2(immagine,livelli,famiglia wavelet);
    % wavedec2 è usata per trasformare l'immagine nel dominio delle
    % wavelet. Essa restituisce C ed S, dove C e' un vettore riga contenente i coefficienti di tutti i
    % livelli (vengono effettuate operazioni matematiche); 
    % mentre S contiene le size delle matrici H, V, D per ogni livello (si va dal basso all'alto), tranne la prima
    % riga che contiene la dimensione della matrice dei coefficienti di approssimazione 
    % utilizzati per approssimare il dominio spaziale in quello delle
    % wavelet. L'ultima riga contiene la dimensione dell'immagine.
    
    
    %fprintf('Compute PNU_Filter (%s): waiting ... Start function on channel %d\n', db_family, num_Canale);
    
    
    for numLivello=1:4
        

        [cH,cV,cD]=detcoef2('all',C,S,numLivello); %matrici dei coefficienti di dettaglio
        % all: voglio tutte e tre le matrici cH, cV, cD per il livello di
        % wavelet num. livello
        
        
        cH2=cH.^2; %matrice dei coefficienti orizzontali al quadrato
        cV2=cV.^2; %matrice dei coefficienti verticali al quadrato
        cD2=cD.^2; %matrice dei coefficienti diagonali al quadrato
        for num_kernel=1:4 % il kernel si usa per fare la media. Il nucleo deve avere dimensioni: 3x3 (ciclo1), 
            %5x5 (ciclo2), 7x7 (ciclo3) e 9x9 (ciclo4).
            
            kernel=fspecial('average',[num_kernel+num_kernel+1 num_kernel+num_kernel+1]);
            % viene calcolata la media con il kernel ottenuto (viene effettuata la convoluzione)
            % 'replicate' significa che per i pixel di bordo, dove non si
            % hanno dei valori, vengono replicati i valori vicino.
            
            cHsigma2(:,:,num_kernel)=imfilter(cH2,kernel,'replicate');%valori restituiti dalla formula(1) STEP 2 senza il max
            cVsigma2(:,:,num_kernel)=imfilter(cV2,kernel,'replicate');%valori restituiti dalla formula(1) STEP 2 senza il max
            cDsigma2(:,:,num_kernel)=imfilter(cD2,kernel,'replicate');%valori restituiti dalla formula(1) STEP 2 senza il max
            cHsigma2(:,:,num_kernel)=cHsigma2(:,:,num_kernel)-(sigma0^2);
            cVsigma2(:,:,num_kernel)=cVsigma2(:,:,num_kernel)-(sigma0^2);
            cDsigma2(:,:,num_kernel)=cDsigma2(:,:,num_kernel)-(sigma0^2);
            [r,c,v]=find(cHsigma2(:,:,num_kernel) < 0);%cerca all'interno della matrice i valori minori di 0 r=righe c=colonne v = valori 
            for m=1:length(r)
                cHsigma2(r(m),c(m),num_kernel)=0;
            end
            [r,c,v]=find(cVsigma2(:,:,num_kernel) < 0);
            for m=1:length(r)
                cVsigma2(r(m),c(m),num_kernel)=0;
            end
            [r,c,v]=find(cDsigma2(:,:,num_kernel) < 0);
            for m=1:length(r)
                cDsigma2(r(m),c(m),num_kernel)=0;
            end
        end
        MinVarianzaCH=funzione_MinimoVarianza(cHsigma2(:,:,1),cHsigma2(:,:,2),cHsigma2(:,:,3),cHsigma2(:,:,4)); %vedi formula 2 STEP 2
        MinVarianzaCV=funzione_MinimoVarianza(cVsigma2(:,:,1),cVsigma2(:,:,2),cVsigma2(:,:,3),cVsigma2(:,:,4)); %vedi formula 2 STEP 2
        MinVarianzaCD=funzione_MinimoVarianza(cDsigma2(:,:,1),cDsigma2(:,:,2),cDsigma2(:,:,3),cDsigma2(:,:,4)); %vedi formula 2 STEP 2 
        cHden=cH.*(MinVarianzaCH./(MinVarianzaCH+(sigma0^2))); %vedi STEP 3 formula 1, coefficienti dettaglio orizzontali senza rumore    
        cVden=cV.*(MinVarianzaCV./(MinVarianzaCV+(sigma0^2))); %vedi STEP 3 formula 1, coefficienti dettaglio verticali senza rumore            
        cDden=cD.*(MinVarianzaCD./(MinVarianzaCD+(sigma0^2))); %vedi STEP 3 formula 1, coefficienti dettaglio diagonali senza rumore
        C=getModifyC(C,cHden,cVden,cDden,S,numLivello);
        clear cHsigma2 cVsigma2 cDsigma2 kernel MinVarianzaCH  MinVarianzaCV MinVarianzaCD cHden cVden cDden cH2 cV2 cD2 cH cV cD r c v;
    end
    imgFiltrata(:,:,num_Canale)=waverec2(C,S,db_family);
end
 

    
