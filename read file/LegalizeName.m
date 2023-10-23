%{
    LeaglizeName is the function that adjust filename to exclude illegal
    characters.
%}
    function VarName = LegalizeName(Name)
        Name = strrep(Name, ' ', '_');
        VarName = regexprep(Name, '[^a-zA-Z0-9_]', '');
        
        while strcmp(VarName(end), '_')
            VarName = VarName(1:end-1);
        end
        %display(VarName);
    end