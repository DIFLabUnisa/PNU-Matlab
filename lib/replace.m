function replace(percorsoFile)

fid=fopen(percorsoFile);
percorsoFile2=strcat(percorsoFile,'_bak.txt');
fid2=fopen(percorsoFile2,'wt');
 
while(~feof(fid))
   line = fgetl(fid);
   line=strrep(line,'.',',');
   line=strrep(line,'e', 'E');
   fprintf(fid2,'%s\n',line);
end
fclose(fid); 
fclose(fid2); 

