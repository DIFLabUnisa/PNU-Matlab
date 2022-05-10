function resizeRP(pathRPIn, pathRPOut)

%
% Roscigno Gianluca - Lanzilli Giuseppe




directory = dir(pathRPIn);
files = {directory.name};



for k = 1 : length(files) 
	 if ~directory(k).isdir 

		rp = sprintf('%s%s',pathRPIn,char(files(k)));

		load (rp);	    

		referencePattern = referencePattern(1:512, 1:512, :);

		rp = sprintf('%s%s',pathRPOut,char(files(k)));

		save (rp, 'referencePattern');

    end

end
