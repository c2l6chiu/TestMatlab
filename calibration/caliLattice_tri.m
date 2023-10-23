function result = caliLattice_tri(lattice, rotation, s_x, s_y)
[m,~] = size(lattice);
if m == 1
    lattice = lattice';
end

result = r_matrix(-rotation)*s_matrix(s_x, s_y)*r_matrix(rotation)*lattice;
    
    function ma = r_matrix(theta)
        theta=1*theta;
        ma = [cosd(theta), sind(theta); -sind(theta), cosd(theta)];
    end
    function mb = s_matrix(s_x_, s_y_)
        mb = [s_x_, 0; 0, s_y_];
    end

end