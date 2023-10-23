%dim is number
%center is in y , x order
function result = gauss2D(dim, center , sigma)
xy = 1:dim;

[X,Y] = meshgrid(xy-center(2) , xy-center(1));

dist2 = (X.*X + Y.*Y);

result = exp(-0.5 * (dist2/sigma^2));

end