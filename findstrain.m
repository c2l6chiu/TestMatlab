function [theta_t,theta_s,eps]=findstrain(M1,M2,M3,t,s,e)
p0=[t,s,e];
fun=@(p) cal_diff(M1,M2,M3,p(1),p(2),p(3));
options = optimoptions(@lsqnonlin,'Algorithm','levenberg-marquardt',...
    'MaxFunctionEvaluations',1e10,'StepTolerance',1.0000e-12,...
    'FunctionTolerance',1e-15,'MaxIterations',1e6);
param=lsqnonlin(fun,p0,[],[],options)
end

function val=cal_diff(m1,m2,m3,tt,ts,ep)
k=4*pi/sqrt(3)/0.246;
k1=k*[1;0];
k2=k*[cos(pi/3);sin(pi/3)];
k3=k*[cos(2*pi/3);sin(2*pi/3)];
% E=[1/(1+ep) 0;0,1/(1-0.16*ep)];
E=[-ep 0;0 0.16*ep];
S=Rot2D(-ts)*E*Rot2D(ts);

ks1=S*k1;
ks2=S*k2;
ks3=S*k3;

kt1=Rot2D(tt)*k1;
kt2=Rot2D(tt)*k2;
kt3=Rot2D(tt)*k3;

l1=4*pi/sqrt(3)/norm(kt1-ks1);
l2=4*pi/sqrt(3)/norm(kt2-ks2);
l3=4*pi/sqrt(3)/norm(kt3-ks3);

val=sqrt((m1-l1)^2+(m2-l2)^2+(m3-l3)^2)*1000;
end


