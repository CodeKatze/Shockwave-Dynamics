M = 3.0;
gamma = 1.4;
phi = linspace(asin(1/M),pi/2,100);

p_po = 1 + 2*gamma/(gamma + 1) * ( (M*sin(phi)).^2 -1);
theta = atan(2*cot(phi).*((M*sin(phi)).^2 - 1)./(2 + M^2*(gamma+cos(2*phi))));

figure(1);
plot(theta,p_po);

title('Shock Polar');
xlabel('Flow Deflection, \theta');
ylabel('P_j/P_o');
hold on;