function F = twoShockVN(X,M0,P0,theta1l,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

M1u = X(1);
M2u = X(2);
P1u = X(3);
P2u = X(4);
theta1u = X(5);
theta2u = X(6);
phi1u = X(7);
phi2u = X(8);
M1l = X(9);
M2l = X(10);
P1l = X(11);
P2l = X(12);
theta2l = X(13);
phi1l = X(14);
phi2l = X(15);

F(1) = sqrt((1 + (g-1)/2*(M0.*sind(phi1u)).^2 )./(g*(M0.*sind(phi1u)).^2 - (g-1)/2))./(sind(phi1u - theta1u)) - M1u;
F(2) = 1+ 2*g/(g+1)*((M0.*sind(phi1u)).^2 -1) - P1u/P0;
F(3) = atand(2*cotd(phi1u).*((M0.*sind(phi1u)).^2 - 1)/( M0.^2.*( g + cosd(2*phi1u) ) + 2)) - theta1u;

F(4) = sqrt((1 + (g-1)/2*(M1u.*sind(phi2u)).^2 )./(g*(M1u.*sind(phi2u)).^2 - (g-1)/2))./(sind(phi2u - theta2u)) - M2u;
F(5) = 1+ 2*g/(g+1)*((M1u.*sind(phi2u)).^2 -1) - P2u/P1u;
F(6) = atand(2*cotd(phi2u).*((M1u.*sind(phi2u)).^2 - 1)/( M1u.^2.*( g + cosd(2*phi2u) ) + 2)) - theta2u;

F(7) = sqrt((1 + (g-1)/2*(M0.*sind(phi1l)).^2 )./(g*(M0.*sind(phi1l)).^2 - (g-1)/2))./(sind(phi1l - theta1l)) - M1l;
F(8) = 1+ 2*g/(g+1)*((M0.*sind(phi1l)).^2 -1) - P1l/P0;
F(9) = atand(2*cotd(phi1l).*((M0.*sind(phi1l)).^2 - 1)/( M0.^2.*( g + cosd(2*phi1l) ) + 2)) - theta1l;

F(10) = sqrt((1 + (g-1)/2*(M1l.*sind(phi2l)).^2 )./(g*(M1l.*sind(phi2l)).^2 - (g-1)/2))./(sind(phi2l - theta2l)) - M2l;
F(11) = 1+ 2*g/(g+1)*((M1l.*sind(phi2l)).^2 -1) - P2l/P1l;
F(12) = atand(2*cotd(phi2l).*((M1l.*sind(phi2l)).^2 - 1)/( M1l.^2.*( g + cosd(2*phi2l) ) + 2)) - theta2l;

F(13) = theta1u - theta2u + theta1l - theta2l;
F(14) = P2l - P2u;
F(15) = 2*g/(g+1)*M0^2 - (g-1)/(g+1) - P2u/P0;
end