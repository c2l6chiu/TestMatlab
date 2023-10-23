%%%%%
% 
% Load 3dc/3di file
%
%%%%%
function [data, exp_par] = load_3d(filename, pathname)
fid=fopen([pathname filename],'r');
if fid == -1
    error();
end
g_slow = fgetl(fid);
g_fast = fgetl(fid);
b =fgetl(fid);
data.gate_slow=str2num(g_slow);
data.gate_fast=str2num(g_fast);
data.bias=str2num(b);
sizeA=[size(data.bias,2) size(data.gate_fast,2)];
data.map = fscanf(fid,'%f',sizeA);
actual_size=size(data.map);
data.gate_fast=data.gate_fast(1:actual_size(2));
fclose(fid);
exp_par='';
end