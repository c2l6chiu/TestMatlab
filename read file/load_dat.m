function [data, exp_par] = load_dat(filename, pathname)
header.filename = filename;
header.pathname = pathname;

if exist([pathname filename], 'file')
    fid = fopen([pathname filename], 'r', 'ieee-be');    % open with big-endian
else
    fprintf('File does not exist.\n');
    return;
end

info = {};
i=1;
while 1
   line_str = strtrim(fgetl(fid));
   if strcmp(line_str, '[DATA]')
       break;
   end
   field=split(regexprep(line_str, '\t', ':'),':');%info = [info; regexprep(line_str, '\t', ':')];
   if length(field)>1
       field_name=regexprep(lower(field{1}), '[^a-z0-9_]', '_');
       field_name=strip(field_name,'_');
       info.(field_name)=field{2};
   else
       info.field{1}='';
   end
   i=i+1;
end

% reading in different channels of data
line_str = fgetl(fid);
signals = strsplit(line_str, '\t');
sweep_signal = signals{1};
channels = signals(2:end);
signal_num = length(signals);
m = textscan(fid, '%f', 'ExpChars', 'E'); 
m = reshape(m{1}, signal_num, round(length(m{1})/signal_num));
for k = 1:signal_num-1
    if strcmp(channels{k},'Lockin X channel (V)')
        k_dIdV=k;
    end
    data(k).channel = channels{k};
    data(k).sweep_signal = sweep_signal;
    data(k).x = m(1,:);
    data(k).y = m(k+1,:);
end
fclose(fid);
exp_par=info;
end