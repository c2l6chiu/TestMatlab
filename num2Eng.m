function str=num2Eng(num,req)
if nargin <2
    req='%.2f';
end

if abs(num)<1 && abs(num)>=1e-3
    num=num*1e3; post='m';
elseif abs(num)<1e-3 && abs(num)>=1e-6
    num=num*1e6; post='u';
elseif abs(num)<1e-6 && abs(num)>=1e-9
    num=num*1e9; post='n';
elseif abs(num)<1e-9 && abs(num)>=1e-12
    num=num*1e12; post='p';
elseif abs(num)<1e-12 && abs(num)>=1e-15
    num=num*1e15; post='f';
elseif abs(num)<1e-15 && abs(num)>=1e-18
    num=num*1e18; post='a';
elseif abs(num)<1e-18 && abs(num)>=1e-21
    num=num*1e21; post='z';
elseif abs(num)<1e-21 && abs(num)>=1e-24
    num=num*1e24; post='y';   
elseif abs(num)<1e6 && abs(num)>=1e3
    num=num*1e-3; post='k';
elseif abs(num)<1e9 && abs(num)>=1e6
    num=num*1e-6; post='M';
elseif abs(num)<1e12 && abs(num)>=1e9
    num=num*1e-9; post='G';
else
    post='';
end

str=[num2str(num,req) post];
end