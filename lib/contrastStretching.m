function contrastStretching(directoryInputImages, directoryOutputImages)

% contrastStretching(directoryInputImages, directoryOutputImages)
%
%
%
%
%
% Autori: Lanzilli Giuseppe- Roscigno Gianluca

directory = dir(directoryInputImages);
files = {directory.name};


for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
            fprintf('Compute Photo %d <<%s>>\n',i-2,char(files(i)));
            img=imread(strcat(directoryInputImages,char(files(i))));

	     size_img=size(img);
	    [row,col]=size(size_img);
		if(col == 2)
    			nCanali=1;
		else
    			nCanali=3;
		end
	
		for canale=1:nCanali,
	    		 ImgC(:,:,canale)=operazione_contrasto(double(img(:,:,canale)));
     		 end

	    nomeFile=strcat('ContrastStretching_', char(files(i)));
	    imwrite(ImgC, strcat(directoryOutputImages,nomeFile));

    end
end

