function [stringRPFormalName] = getRPFormalName(stringRP)

% getRPFormalName(stringRP)
% 
% La funzione restituisce il nome formale del reference pattern,
% cioe' elimina n_ da strinRP='n_REFERENCE PATTERN Camera X';
%
% Roscigno Gianluca - Lanzilli Giuseppe


stringRPFormalName = strrep(stringRP, '.mat', '');

n = length(stringRPFormalName);

for i=1:n

	c = stringRPFormalName(i);

	if(c=='_')
		stringRPFormalName = stringRPFormalName(i+1:n);
		return;
	end;
end;



