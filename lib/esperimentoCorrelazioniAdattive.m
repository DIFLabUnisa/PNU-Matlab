function esperimentoCorrelazioniAdattive(dirImages, dirRP, fileOutputName)

directoryImgs = dir(dirImages);
filesImgs = {directoryImgs.name};

directoryRP = dir(dirRP);
filesRPs = {directoryRP.name};

fileOutput = fopen(fileOutputName, 'wt');



for i = 1 : length(filesImgs) %(per ogni immagine)

if ~directoryImgs(i).isdir 

%lettura immagine
nomeImage=char(filesImgs(i));
Image=imread(strcat(dirImages, nomeImage));

	for j = 1 : length(filesRPs) %(per ogni RPs)
	 if ~directoryRP(j).isdir % escludo qualsiasi cartella, anche ./ ../

		stringaPattern=char(filesRPs(j));
		nomeRP=strcat(dirRP, stringaPattern);
		load (nomeRP);

		for db=1:3
			%popolare variabile db_family

			if(db==1)
				db_family='db2';
			end

			if(db==2)
				db_family='db4';
			end

			if(db==3)
				db_family='db8';
			end


			for dim=1:7
                
				if(dim==1)
					righe=64;
					colonne=64;
				end


				if(dim==2)
					righe=128;
					colonne=128;
				end

				if(dim==3)
					righe=256;
					colonne=256;
				end

				if(dim==4)
					righe=512;
					colonne=512;
				end

				if(dim==5)
					righe=1024;
					colonne=1024;
				end

				if(dim==6)
					righe=2048;
					colonne=2048;
				end

				if(dim==7)
					[righe, colonne] = size(Image(:,:,1));
				end

				for colore=1:2

					referencePatternTmp = referencePattern(1:righe, 1:colonne, :);


					if(colore==1)
						str_colore='RGB';
						referencePatternTmp2=referencePatternTmp;
					end

					
					if(colore==2)
						str_colore='GS';
						referencePatternTmp2 = rgb2gray(referencePatternTmp);
					end


					[residual_noise]= getResidualNoiseAdattivo(Image, db_family, righe, colonne, str_colore);
					
fprintf('\n');
					[result_corr] = correlazione(residual_noise, referencePatternTmp2);

                    if(colore==2)
                        [corr1] = replaceSTR(sprintf('%g',result_corr));
                        fprintf(fileOutput, '%s; RN%s(%s); (%dx%d); %s; %s;\n', stringaPattern, db_family, nomeImage, righe, colonne, str_colore, corr1);
                    end
                    
                if(colore==1)
					[corr1] = replaceSTR(sprintf('%g',result_corr(1)));
            				[corr2] = replaceSTR(sprintf('%g',result_corr(2)));
           				[corr3] = replaceSTR(sprintf('%g',result_corr(3)));
        
      					fprintf(fileOutput, '%s; RN%s(%s); (%dx%d); %s; %s; %s; %s;\n', strrep(stringaPattern, '.mat',''), db_family, nomeImage, righe, colonne, str_colore, corr1, corr2, corr3);
                end
				end	
			end	
        end
	end
    end
end
end
