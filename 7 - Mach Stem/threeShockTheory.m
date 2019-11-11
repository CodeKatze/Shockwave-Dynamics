function F = threeShockTheory(X,M0,P0,theta1,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

M1 = X(1);
M2 = X(2);
M3 = X(3);
P1 = X(4);
P2 = X(5);
P3 = X(6);
theta2 = X(7);
theta3 = X(8);
phi1 = X(9);
phi2 = X(10);
phi3 = X(11);

F(1) = sqrt((1 + (g-1)/2*(M0.*sind(phi1)).^2 )./(g*(M0.*sind(phi1)).^2 - (g-1)/2))./(sind(phi1 - theta1)) - M1;
F(2) = 1+ 2*g/(g+1)*((M0.*sind(phi1)).^2 -1) - P1/P0;
F(3) = atand(2*cotd(phi1).*((M0.*sind(phi1)).^2 - 1)/( M0.^2.*( g + cosd(2*phi1) ) + 2)) - theta1;

F(4) = sqrt((1 + (g-1)/2*(M1.*sind(phi2)).^2 )./(g*(M1.*sind(phi2)).^2 - (g-1)/2))./(sind(phi2 - theta2)) - M2;
F(5) = 1+ 2*g/(g+1)*((M1.*sind(phi2)).^2 -1) - P2/P1;
F(6) = atand(2*cotd(phi2).*((M1.*sind(phi2)).^2 - 1)/( M1.^2.*( g + cosd(2*phi2) ) + 2)) - theta2;

F(7) = sqrt((1 + (g-1)/2*(M0.*sind(phi3)).^2 )./(g*(M0.*sind(phi3)).^2 - (g-1)/2))./(sind(phi3 - theta3)) - M3;
F(8) = 1+ 2*g/(g+1)*((M0.*sind(phi3)).^2 -1) - P3/P0;
F(9) = atand(2*cotd(phi3).*((M0.*sind(phi3)).^2 - 1)/( M0.^2.*( g + cosd(2*phi3) ) + 2)) - theta3;

F(10) = theta1 - theta2 - theta3;
F(11) = P2 - P3;

end