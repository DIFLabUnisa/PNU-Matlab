function [line] = replaceSTR(line)

line=strrep(line,'.',',');
line=strrep(line,'e', 'E');




