function [referencePattern] = resizeReferencePattern(referencePattern, dimensioni)

% [referencePattern] = resizeReferencePattern(referencePattern, dimensioni);

referencePattern = imresize(referencePattern, dimensioni);
