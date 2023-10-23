function [scaleX, scaleY,theta] = caliPiezo_tri(positionA, positionB,lattice_constant)

it_theta = 1000*90;
thetaAB_d = zeros(it_theta, 1);
theta_it = zeros(it_theta, 1);
scaleX_it = zeros(it_theta, 1);
scaleY_it = zeros(it_theta, 1);

for i = 1:it_theta
    theta_tmp = (i - 1) * 90 / (it_theta - 1);
    m_rotation = r_matrix(theta_tmp);
    positionA_r = m_rotation * positionA;
    positionB_r = m_rotation * positionB;
    
    s_x = ((positionB_r(2) ^ 2 - positionA_r(2) ^ 2) /...
           (positionA_r(1) ^ 2 - positionB_r(1) ^ 2)) ^ 0.5;
    if isreal(s_x)
        m_stretch = s_matrix(s_x, 1);
        positionA_r_s = m_stretch * positionA_r;
        positionB_r_s = m_stretch * positionB_r;
        
        [thetaA_r_s,rhoA_r_s] = cart2pol(positionA_r_s(1), positionA_r_s(2));
        [thetaB_r_s,rhoB_r_s] = cart2pol(positionB_r_s(1), positionB_r_s(2));
        thetaAB_d(i) = abs(abs(rad2deg(thetaA_r_s - thetaB_r_s) ) - 60);
        
        
        s_d = lattice_constant / rhoA_r_s;
        theta_it(i) = theta_tmp;
        scaleX_it(i) = s_x * s_d;
        scaleY_it(i) = s_d;
    else
        thetaAB_d(i) = 100;
        theta_it(i) = 0;
        scaleX_it(i) = 0;
        scaleY_it(i) = 0;
    end
end
[~,ind_min] = min(thetaAB_d);
theta = theta_it(ind_min);
scaleX = scaleX_it(ind_min);
scaleY = scaleY_it(ind_min);

    function ma = r_matrix(theta)
        ma = [cosd(theta), sind(theta); -sind(theta), cosd(theta)];
    end
    function mb = s_matrix(s_x_, s_y_)
        mb = [s_x_, 0; 0, s_y_];
    end
end

%rad2deg
%[theta,rho] = cart2pol(x,y)
%[x,y] = pol2cart(theta,rho)
