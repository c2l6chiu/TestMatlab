
%{
    VarTyprDefiner is a function that determines which type of map it is by
    the channel name and the sweep signal.
%}
function VarType = ChannelAbbr(ChannelName, SweepSignal)
if nargin == 2 && ~strcmpi(SweepSignal, 'Bias (V)')
    VarType = ['Unknown_' regexprep(ChannelName(1:end-3), '[[]]', '')];
    fprintf('Unknown map type %s \n', ChannelName);
    return;
else
    switch ChannelName
        case {'LIX1omega(A)', 'LIDemod1X(A)','LIX1omega', 'LIDemod1X'}
            VarType = 'G';
        case{'LIX1omega[bwd](A)','LIDemod1X[bwd](A)','LIX1omega[bwd]','LIDemod1X[bwd]'}
            VarType = 'G_bwd';
        case {'Current(A)','Current'}
            VarType = 'I';
        case {'Current[bwd](A)','Current_bwd'}
            VarType = 'I_bwd';
        case {'Z'}
            VarType = 'T';
        case {'Z_bwd'}
            VarType = 'T_bwd';
        otherwise
            VarType = ['Unkown_' regexprep(ChannelName(1:end-3), '[[]]', '')];
    end
end
end
%VarTypeDefiner is a function that determines the var type of each map,
%e.g. topo map.
