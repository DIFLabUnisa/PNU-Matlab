function outstr = substring(str, offset, len, repl)
%   La funzione estrae una sottostringa da una stringa.
%%   SUBSTR (stringa, OFFSET, LENGTH) estrae una sottostringa di stringa con la LUNGHEZZA
%   data a partire dall'OFFSET dato. Il primo carattere e' a OFFSET 0. Se l'OFFSET e' negativo,
%   inizia a quella distanza dalla fine della stringa. Se la LUNGHEZZA viene omessa, 
%   restituisce tutto ciò che alla fine della stringa. Se la lunghezza
%   è negativa, si tolgono questi molti caratteri dalla fine della stringa.
%
%
%   SUBSTR(STRING, OFFSET, LENGTH, REPLACEMENT) non ritornera' la sottostringa 
%   come specificato da STRING, OFFSET, e LENGTH (vedi sopra) ma  piuttosto la rimpiazza 
%   con REPLACEMENT (repl) e restituisce il risultato.
%
%   Esempi:
%
%      ottenere il primo carattere:      	 	substr(string,  0, 1)
%      ottenere l'ultimo carattere:      	 	substr(string, -1, 1)
%      rimuovere il primo carattere:     	 	substr(string,  1)
%      rimuovere l'ultimo carattere:     	 	substr(string,  0, -1)
%      rimuovere il primo e l'ultimo carattere:  	substr(string,  1, -1)
%
%
%   Autori: Lanzilli Giuseppe - Roscigno Gianluca

   % Controllo del numero di argomenti in input.
   error(nargchk(2, 4, nargin));

   n = length(str);

   % Get lower index.
   lb = offset + 1;             % offset dall'inizio della stringa
   if offset < 0
      lb = lb + n;              % offset dalla fine della stringa
   end
   lb = max(lb, 1);

   % Get upper index.
   if nargin == 2               % SUBSTR(STR, OFFSET)
      ub = n;
   elseif nargin > 2            % SUBSTR(STR, OFFSET, LEN)
      if len >= 0
         ub = lb + len - 1;
      else
         ub = n + len;
      end
      ub = min(ub, n);
   end

   % Estrazione o rimpiazzamento sottostringa.
   if nargin < 4
      outstr = str(lb : ub);                        % estrazione sottostringa
   else
      outstr = [str(1:lb-1) repl str(ub+1:end)];    % rimpiazzamento sottostringa
   end

