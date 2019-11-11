function guess = initialGuess(M0,P0,theta_w,g)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

theta1 = theta_w;
phi1 = phifromtheta(M0,theta1,g);
M1 = sqrt((1 + (g-1)/2*(M0.*sind(phi1)).^2 )./(g*(M0.*sind(phi1)).^2 - (g-1)/2))./(sind(phi1 - theta1));
theta2 = theta_w;
phi2 = phifromtheta(M1,theta2,g);
M2 = sqrt((1 + (g-1)/2*(M1.*sind(phi2)).^2 )./(g*(M1.*sind(phi2)).^2 - (g-1)/2))./(sind(phi2 - theta2));
phi3 = 90;
theta3 = 0;
M3 = sqrt((1 + (g-1)/2*(M2.*sind(phi3)).^2 )./(g*(M2.*sind(phi3)).^2 - (g-1)/2))./(sind(phi3 - theta3));

P1 = P0*(1+ 2*g/(g+1)*((M0.*sind(phi1)).^2 -1));
P2 = P1*(1+ 2*g/(g+1)*((M1.*sind(phi2)).^2 -1));
P3 = P2*(1+ 2*g/(g+1)*((M2.*sind(phi3)).^2 -1));

guess = [M1 M2 M3 P1 P2 P3 theta2 theta3 phi1 phi2 phi3];
end

