function phi = Thetaj_fun(Mi,thetai,g)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms phi;

f = @(phi) 2*cotd(phi).*((Mi.*sind(phi)).^2 - 1)./(2 + Mi.^2.*(g+cosd(2*phi))) - tand(thetai);
df = @(phi) ( (2 + Mi.^2.*(g+cosd(2*phi))).*(-2*cscd(phi).^2.*((Mi.*sind(phi)).^2 - 1) + 2*cotd(phi)*2.*Mi.^2.*sind(phi).*cosd(phi)) - (2*cotd(phi).*((Mi.*sind(phi)).^2 - 1)).*(-2*Mi.^2.*sind(2*phi)) )./((2 + Mi.^2.*(g+cosd(2*phi)).^2));

x = 0.1*thetai./thetai;
for i=1:0.1:1000
    x1 = x - (f(x)./df(x));
    x = x1;
end
if x < 90
    phi = x;
else
    phi = 180 -x;
end

end

