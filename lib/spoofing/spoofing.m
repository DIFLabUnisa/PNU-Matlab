function spoofing(directoryImages, referencePattern, directoryImagesOutput)

% spoofing(directoryImages, referencePattern, directoryImagesOutput)
%
% Roscigno Gianluca - Lanzilli Giuseppe


directory = dir(directoryImages);
files = {directory.name};


for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
            fprintf('Compute Photo %d <<%s>>\n',i-2,char(files(i)));
            img=imread(strcat(directoryImages,char(files(i))));

	    [residual_noise,filter_image]= getResidualNoise(img);

	    newImage(:,:,1) = double(referencePattern(:,:,1)) + double(filter_image(:,:,1));
	    newImage(:,:,2) = double(referencePattern(:,:,2)) + double(filter_image(:,:,2));
	    newImage(:,:,3) = double(referencePattern(:,:,3)) + double(filter_image(:,:,3));
	    imwrite(uint8(newImage), strcat(directoryImagesOutput, char(files(i))));  

            clear img residual_noise newImage;
    end
end

