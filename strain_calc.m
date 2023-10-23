


Ps=0.16;
theta=0.48/180*pi;strain=0.006;ts=0;


for i=1:401
    theta=(i-1)/100/180*pi;
    for j=1:41
        strain=(j-1)/10/100;
        for m=1:181
            ts=(m-1)/180*pi;
            
            k1=[1;0];k2=[0.5;sqrt(3)/2];k3=[-0.5;sqrt(3)/2];
            
            R=[cos(theta),-sin(theta);sin(theta),cos(theta)];
            kp1=R*k1;kp2=R*k2;kp3=R*k3;
            
            S=[cos(ts),sin(ts);-sin(ts),cos(ts)]*[1/(1+strain),0;0,1/(1-strain*Ps)]*[cos(ts),-sin(ts);sin(ts),cos(ts)];
            ks1=S*k1;ks2=S*k2;ks3=S*k3;
            
            l1(i,j,m)=1/norm(ks1-kp1)*0.246;l2(i,j,m)=1/norm(ks2-kp2)*0.246;l3(i,j,m)=1/norm(ks3-kp3)*0.246;
            
            theta_array(i,j,m)=theta;
            strain_array(i,j,m)=strain;
            ts_array(i,j,m)=ts;
        end
    end
end

a=take4
diff=(a(1)-l1(:)).^2+(a(2)-l2(:)).^2+(a(3)-l3(:)).^2;
[minv,minx]=min(diff);
[theta_array(minx)*180/pi,strain_array(minx),ts_array(minx)*180/pi]