%a1*exp(-((x-b1)/c1)^2)

function result_fit=getPeak_Gauss(spectrum, range)
length_spectrum = length(spectrum.x);

ind_range = interp1(spectrum.x, 1:length_spectrum, range);
range = round(ind_range);

result_fit = fit(spectrum.x(range(1):range(2))', spectrum.y(range(1):range(2))', 'gauss1');

% plot(result_fit, spectrum.x, spectrum.y);
end