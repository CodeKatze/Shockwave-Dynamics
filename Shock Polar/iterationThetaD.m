function phi = iterationThetaD(M0,theta0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms phi;
gamma = 1.4;

f = @(phi) 2*cotd(phi).*((M0.*sind(phi)).^2 - 1)./(2 + M0.^2.*(gamma+cosd(2*phi))) - tand(theta0);
df = @(phi) ( (2 + M0.^2.*(gamma+cosd(2*phi))).*(-2*cscd(phi).^2.*((M0.*sind(phi)).^2 - 1) + 2*cotd(phi)*2.*M0.^2.*sind(phi).*cosd(phi)) - (2*cotd(phi).*((M0.*sind(phi)).^2 - 1)).*(-2*M0.^2.*sind(2*phi)) )./((2 + M0.^2.*(gamma+cosd(2*phi)).^2));


x = 10*theta0./theta0;
for i=1:0.1:1000
    x1 = x - (f(x)./df(x));
    x = x1;
end
phi = x;
end

