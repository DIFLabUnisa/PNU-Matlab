function [C]= getModifyC(C,cH,cV,cD,S,livello)
%C = vettore dei coefficienti di tutti i livelli
%cH = matrice dei coefficienti orizontali
%cV = matrice dei coefficienti verticali
%cD = matrice dei coefficienti diagonali
%S = matrice dei livelli formata da due colonne
%livello = livello di cui si vuole modificare i coefficienti C
%
% Autori: Lanzilli Giuseppe - Roscigno Gianluca


maxLivello=size(S,1)-2;
if(livello<=0)
    fprintf('il livello deve essere positivo\n');
    return;
end
if(maxLivello<livello)
    fprintf('numero del livello maggiore del livello massimo\n');
    return;
end
offset = S(1,1)*S(1,2)+1;
nIterazioni=maxLivello-livello+1;
livelloAttuale=nIterazioni+1;
for i=2:nIterazioni
    offset=(S(i,1)*S(i,2)*3)+offset;
end
supp=offset+(S(livelloAttuale,1)*S(livelloAttuale,2));
C(offset:supp-1)=cH;
offset=supp;
supp=offset+(S(livelloAttuale,1)*S(livelloAttuale,2));
C(offset:supp-1)=cV;
offset=supp;
supp=offset+(S(livelloAttuale,1)*S(livelloAttuale,2));
C(offset:supp-1)=cD;
