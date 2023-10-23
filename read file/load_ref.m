function data=load_ref(filename, pathname)

fid=fopen([pathname filename],'r');
fgetl(fid);
data=[];

while ~feof(fid)
    tline = fgetl(fid);
    c=strsplit(tline);
    gate= str2num(c{1});
    current= str2num(c{2})*1e-12;
    data = [data; gate, current];
end
end