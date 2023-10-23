%inspired by get_STM_View_cm which is written by Chih-Chuan Su 20170829
%written by CLChiu 20180712

function [cName,cMap]=getColorMap()
    path= [fileparts(mfilename('fullpath')) '/Color Maps']; %windows: \ mac: /
    cCode = dir(fullfile(path, '*.mat'));
    for i = 1:size(cCode,1)
        cName{i} = cCode(i).name(1:end-4);
        cMap{i}=cell2mat(struct2cell(load(fullfile(path,cName{i}))));
    end
end