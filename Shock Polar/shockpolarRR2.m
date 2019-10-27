M = 3.0;
gamma = 1.4;
phi = linspace(asin(1/M),pi/2,100);

p_po = 1 + 2*gamma/(gamma + 1) * ( (M*sin(phi)).^2 -1);
theta = atan(2*cot(phi).*((M*sin(phi)).^2 - 1)./(2 + M^2*(gamma+cos(2*phi))));

M2 = 1./sin(phi - theta).*sqrt((1 + (gamma-1)/2 * (M*sin(phi)).^2)./(gamma * (M*sin(phi)).^2) - (gamma-1)/2);

m2 = M2(15);
phi2 = linspace(asin(1/m2),pi/2,100);
theta2 = atan(2*cot(phi2).*((m2*sin(phi2)).^2 - 1)./(2 + m2^2*(gamma+cos(2*phi))));
p_po2 = (1 + 2*gamma/(gamma + 1) * ( (m2.*sin(phi2)).^2 -1))*p_po(15);

theta_w = theta(15);

figure(1);
plot(theta,p_po);
hold on;
plot(theta_w - theta2,p_po2);
title('Shock Polar');
xlabel('Flow Deflection, \theta');
ylabel('P_j/P_o');
