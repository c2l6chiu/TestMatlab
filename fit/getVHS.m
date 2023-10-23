function result_VHS=getVHS(data, range_gate, ini_VHS)
width_VHS=4e-3; %width of the VHS for fitting

length_gate=length(data.gate);
ind_range_gate = interp1(data.gate, 1:length_gate, range_gate);
ind_range_gate = round(ind_range_gate);

ind_ini_VHS_gate = interp1(data.gate, 1:length_gate, ini_VHS.gate);
ind_ini_VHS_gate = round(ind_ini_VHS_gate);

for j = 1:2
    if j == 1
        k = ind_ini_VHS_gate:-1:min(ind_range_gate);
    else
        k = ind_ini_VHS_gate:max(ind_range_gate);
    end
    
    range_bias = [-1, 1].* width_VHS/2 + ini_VHS.bias;
    for i = k
        spectrum.x = data.bias;
        spectrum.y = data.map(:,i)';
        result_fit = getPeak_Gauss(spectrum, range_bias);
        ind_current = i - min(ind_range_gate) + 1;
        result_VHS.gate(ind_current) = data.gate(i);
        result_VHS.bias(ind_current) = result_fit.b1;
        range_bias = [-1, 1].* width_VHS/2 + result_fit.b1;
    end
end

%assignin('base','debug',result_VHS);
result_VHS.ini_VHS=ini_VHS;

gbFigure(data,'fit');
hold on
scatter(result_VHS.bias*1000, result_VHS.gate,'k');

end