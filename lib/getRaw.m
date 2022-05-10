function [Raw, GrayScaleRaw] = getRaw(percorsoImmagineRGB)

% [Raw, GrayScaleRaw] = getRaw(percorsoImmagineRGB);
% 
% Dato in input il percorso di una immagine RGB, la funzione
% restituisce il RAW ed il GrayScaleRaw in accordo al Bayer Pattern,
% cioe': | R G R G R G R G .... |
%        | G B G B G B G B .... |
%        | R G ................ |
%        | G B ................ |
%        | .................... |
%        | .................... |
%
% Dato i che rappresenta l'indice di riga, e j che rappresenta l'indice di colonna:
% se i e j sono dispari devo considerare il canale R (rosso);
% se i e j sono pari devo considerare il canale B (blu);
% altrimenti, devo considerare il canale G (verde).
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


ImmagineRGB=imread(percorsoImmagineRGB);

[righe, colonne, canali]=size(ImmagineRGB);

Raw=zeros(righe, colonne, canali);
GrayScaleRaw=zeros(righe, colonne);

for i=1:righe,
	for j=1:colonne,

		if mod(i,2)~=0 && mod(j,2)~=0,
			Raw(i,j,1)=ImmagineRGB(i,j,1);
			GrayScaleRaw(i,j)=ImmagineRGB(i,j);
		elseif mod(i,2)==0 && mod(j,2)==0,
			Raw(i,j,3)=ImmagineRGB(i,j,3);
			GrayScaleRaw(i,j)=ImmagineRGB(i,j);
		else	
			Raw(i,j,2)=ImmagineRGB(i,j,2);
			GrayScaleRaw(i,j)=ImmagineRGB(i,j);
		end
	end
end

figure, imshow(uint8(ImmagineRGB));
figure, imshow(uint8(Raw));
figure, imshow(uint8(GrayScaleRaw));

