function referencePatternCropped = cropPattern(referencePattern, righe, colonne);

[row, col, numCanali] = size(referencePattern);

for i=1:numCanali,

	referencePatternCropped(:,:,i) = imresize(referencePattern(:,:,i),[righe colonne]);
end;
