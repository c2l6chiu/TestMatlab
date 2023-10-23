%%%%%
% 
% Load GBplot file
%
%%%%%
function [data, exp_par] = load_GBs(filename, pathname)

fid=fopen([pathname filename],'r');
g = fgetl(fid);
b =fgetl(fid);
data.gate=str2num(g);
data.bias=str2num(b);
sizeA=[size(data.bias,2) size(data.gate,2)];
data.map = fscanf(fid,'%f',sizeA);
actual_size=size(data.map);
data.gate=data.gate(1:actual_size(2));
fclose(fid);
exp_par='';
end