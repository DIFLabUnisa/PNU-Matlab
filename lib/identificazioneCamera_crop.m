function identificazioneCamera_resize(percorsoRP, immaginePercorso, nomeImmagine, FID_FileCorrelazione)
%  identificazioneCamera_resize(percorsoRP,immaginePercoso, nomeImmagine, FID_FileCorrelazione)
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

% fprintf('percorsoRP: %s \n',percorsoRP);
% fprintf('immaginePercorso: %s \n',immaginePercorso);
% fprintf('nomeImmagine: %s \n', nomeImmagine);


FileCorrelazione=FID_FileCorrelazione;
immagine=imread(immaginePercorso);

[righe, colonne, canali] = size(immagine);

directory = dir(percorsoRP);
files = {directory.name};


[residual_noise]=getResidualNoise(immagine);
clear immagine;

for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../


        fileRP=strcat(percorsoRP,char(files(i)));
        load (fileRP);

	[righeRP, colonneRP, canaliRP] = size(referencePattern);

	minRighe=min(righe, righeRP);
	minColonne=min(colonne, colonneRP);
	referencePatternTmp = referencePattern(1:minRighe, 1:minColonne, :); %cropped
	residual_noiseTmp = residual_noise(1:minRighe, 1:minColonne, :); %cropped
           
	
        result_corr=correlazione(referencePatternTmp, residual_noiseTmp);
        clear referencePatternTmp residual_noiseTmp;

	nomePattern=strrep(char(files(i)),'.mat','');

        [corr1] = replaceSTR(sprintf('%g',result_corr(1)));
        [corr2] = replaceSTR(sprintf('%g',result_corr(2)));
        [corr3] = replaceSTR(sprintf('%g',result_corr(3)));

        fprintf(FileCorrelazione,'%s RN(%s) %s %s %s\n\n', nomePattern, nomeImmagine, corr1, corr2, corr3);
       
    end
end


