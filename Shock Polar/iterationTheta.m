function phi = iterationTheta(M0,theta0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
syms phi;
gamma = 1.4;

f = @(phi) 2*cot(phi).*((M0.*sin(phi)).^2 - 1)./(2 + M0.^2.*(gamma+cos(2*phi))) - tan(theta0);
df = @(phi) ( (2 + M0.^2.*(gamma+cos(2*phi))).*(-2*csc(phi).^2.*((M0.*sin(phi)).^2 - 1) + 2*cot(phi)*2.*M0.^2.*sin(phi).*cos(phi)) - (2*cot(phi).*((M0.*sin(phi)).^2 - 1)).*(-2*M0.^2.*sin(2*phi)) )./((2 + M0.^2.*(gamma+cos(2*phi)).^2));


x = theta0./theta0;
for i=1:1:100
    x1 = x - (f(x)./df(x));
    x = x1;
end
phi = x;
end

