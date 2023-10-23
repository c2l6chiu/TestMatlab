function result=load_multi_sxm()
%Mid v=2 scan_3_257-384
ind = 129:256;
%Mid v=7.5 scan_3_129-256
%ind = 257:384;
basename = 'scan_3_';
pathname = '/Users/c2l6chiu/Library/CloudStorage/OneDrive-SharedLibraries-PrincetonUniversity/VFstm - Documents/01 Data/C032/nanonis/';

result.ind = ind;
result.basename = basename;
result.pathname = pathname;

for i=1:length(ind)
    data{i} = load_sxm([basename , num2str(ind(i),'%03.f') , '.sxm'], pathname, nan);
end

result.data=data;

end