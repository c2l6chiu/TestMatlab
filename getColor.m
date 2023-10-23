%get single color map by assigning the name

%=./255;
%=flipud()

function cMap=getColor(ccode)
path= [fileparts(mfilename('fullpath')), '/Color Maps'];
cMap=cell2mat(struct2cell(load(fullfile(path,ccode))));	
end

