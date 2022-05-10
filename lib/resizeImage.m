function resizeImage(percorsoInput,percorsoOutput,risoluzione)
% resizeImage(percorsoInput,percorsoOutput,risoluzione);
% Resize immagini 
%
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca

directory = dir(percorsoInput);
files = {directory.name};

for i = 1 : length(files)
    if ~directory(i).isdir % escludo qualsiasi cartella, anche ./ ../
       img=imread(strcat(percorsoInput,char(files(i))));
       imgN=imresize(img,risoluzione);
       imwrite(imgN,strcat(percorsoOutput,char(files(i))));
       clear img imgN;
    end
end
