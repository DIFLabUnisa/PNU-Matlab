function referencePatternResize = resizePattern(referencePattern, righe, colonne);

[row, col, numCanali] = size(referencePattern);

for i=1:numCanali,

	referencePatternResize(:,:,i) = imresize(referencePattern(:,:,i),[righe colonne]);
end;
