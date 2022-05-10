function spoofing2(directoryImages, directoryImagesOutput)

% spoofing2(directoryImages, directoryImagesOutput)
%
% Roscigno Gianluca - Lanzilli Giuseppe


directory = dir(directoryImages);
files = {directory.name};


for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
            fprintf('Compute Photo %d <<%s>>\n',i-2,char(files(i)));
            img=imread(strcat(directoryImages,char(files(i))));

	    [residual_noise,filter_image]= getResidualNoise(img);

	    imwrite(uint8(filter_image), strcat(directoryImagesOutput, char(files(i))));  

            clear img residual_noise filter_image;
    end
end

