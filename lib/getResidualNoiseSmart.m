function [residual_noise,filter_image] = getResidualNoiseSmart(imagePath)
%GETRESIDUALNOISESMART Summary of this function goes here
%   Detailed explanation goes here

    rnPath = strcat(imagePath, '.mat');

    if exist(rnPath, 'file') == 0
        img = imread(imagePath);
        filter_image=filtro_PNU(img,5);
        residual_noise=double(img)-double(filter_image);
        save(rnPath,'filter_image','residual_noise');
    else
        load(rnPath);
    end
end

