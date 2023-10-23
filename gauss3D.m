%dim is number
%center is in y , x order
function result = gauss3D(dim, center , sigma, depth)
xy = 1:dim;

[X,Y] = meshgrid(xy-center(2) , xy-center(1));

dist2 = (X.*X + Y.*Y + depth^2);

result = exp(-0.5 * (dist2/sigma^2));

end