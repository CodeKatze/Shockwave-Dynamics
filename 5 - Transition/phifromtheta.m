function phi = phifromtheta(Mi,thetai,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

f = @(phi) 2*cotd(phi).*((Mi.*sind(phi)).^2 - 1)./(2 + Mi.^2.*(g+cosd(2*phi))) - tand(thetai);
phi_guess = zeros(size(Mi));

phi = arrayfun(@(guess) fsolve(f,guess),phi_guess);

end

