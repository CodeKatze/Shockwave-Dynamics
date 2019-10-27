M1 = 3.0;
gamma = 1.4;
theta_w = 15;

phi = linspace(asind(1/M1),90,100);
p_po = 1 + 2*gamma/(gamma + 1) * ( (M1*sind(phi)).^2 -1);
theta = atand(2*cotd(phi).*((M1*sind(phi)).^2 - 1)./(2 + M1^2*(gamma+cosd(2*phi))));

theta_1 = theta_w;
phi_1 = iterationThetaD(M1,theta_1);
p_po_1 = 1 + 2*gamma/(gamma + 1) * ( (M1*sind(phi_1)).^2 -1);
M2 = sqrt( (1+(((gamma-1)*(M1*sind(phi_1))^2)/2)) / ((gamma*(M1*sind(phi_1))^2) - (gamma-1)/2)) /sind(phi_1 - theta_1);

phi2 = linspace(asind(1/M2),90,100);
theta2 = atand(2*cotd(phi2).*((M2*sind(phi2)).^2 - 1)./(2 + M2^2*(gamma+cosd(2*phi))));
p_po2 = (1 + 2*gamma/(gamma + 1) * ( (M2.*sind(phi2)).^2 -1))*p_po_1;


figure(1);
plot(theta,p_po,'b',-1*theta,p_po,'b');
hold on;

y = [0 p_po(end)*1.92];
plot([0 0],y,'k');

plot(theta_w - theta2,p_po2,'r',theta_w + theta2,p_po2,'r');



title('Shock Polar');
xlabel('Flow Deflection, \theta');
ylabel('P_j/P_o');
