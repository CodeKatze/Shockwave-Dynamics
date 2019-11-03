function F = eqns_Vn(X,M0,P0,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

M1 = X(1);
M2 = X(2);
M3 = X(3);
P1 = X(4);
P2 = X(5);
P3 = X(6);
theta1 = X(7);
theta2 = X(8);
theta3 = X(9);
phi1 = X(10);
phi2 = X(11);
phi3= X(12);

F(1) = sqrt( (1 + (g-1)*(M0.*sind(phi1)).^2 + ( (g+1)^2/4 - g.*sind(phi1).^2 ).*(M0.^2.*sind(phi1)).^2)./(g*(M0.*sind(phi1)).^2 - (g-1)/2) ./ ((M0.*sind(phi1)).^2 +1) ) - M1;
F(2) = 2/(g+1)*(g*(M0.*sind(phi1)).^2 - (g-1)/2) - P1/P0;
% rhoj_rhoi = ( (g+1)*(Mi.*sind(phij)).^2 )/( (g-1)*(Mi.*sind(phij)).^2 +2 );
% tj_ti = ( (g-1)*(Mi.*sind(phij)).^2 + ( (g+1)^2/4  - g*sind(phij).^2).*(Mi.^2.*sind(phij)).^2 )./ (g*(Mi.*sind(phij)).^2-(g-1)/2) ./ ((Mi.*sind(phij)).^2 +1) ;
F(3) = atand(2*cotd(phi1).*((M0.*sind(phi1)).^2 - 1)/( M0.^2.*( g + cosd(2*phi1) ) + 2)) - theta1;

F(4) = sqrt( (1 + (g-1)*(M1.*sind(phi2)).^2 + ( (g+1)^2/4 - g.*sind(phi2).^2 ).*(M1.^2.*sind(phi2)).^2)./(g*(M1.*sind(phi2)).^2 - (g-1)/2) ./ ((M1.*sind(phi2)).^2 +1) ) - M2;
F(5) = 2/(g+1)*(g*(M1.*sind(phi2)).^2 - (g-1)/2) - P2/P1;
% rhoj_rhoi = ( (g+1)*(Mi.*sind(phij)).^2 )/( (g-1)*(Mi.*sind(phij)).^2 +2 );
% tj_ti = ( (g-1)*(Mi.*sind(phij)).^2 + ( (g+1)^2/4  - g*sind(phij).^2).*(Mi.^2.*sind(phij)).^2 )./ (g*(Mi.*sind(phij)).^2-(g-1)/2) ./ ((Mi.*sind(phij)).^2 +1) ;
F(6) = atand(2*cotd(phi2).*((M1.*sind(phi2)).^2 - 1)/( M1.^2.*( g + cosd(2*phi2) ) + 2)) - theta2;

F(7) = sqrt( (1 + (g-1)*(M0.*sind(phi3)).^2 + ( (g+1)^2/4 - g.*sind(phi3).^2 ).*(M0.^2.*sind(phi3)).^2)./(g*(M0.*sind(phi3)).^2 - (g-1)/2) ./ ((M0.*sind(phi3)).^2 +1) ) - M3;
F(8) = 2/(g+1)*(g*(M0.*sind(phi3)).^2 - (g-1)/2) - P3/P0;
% rhoj_rhoi = ( (g+1)*(Mi.*sind(phij)).^2 )/( (g-1)*(Mi.*sind(phij)).^2 +2 );
% tj_ti = ( (g-1)*(Mi.*sind(phij)).^2 + ( (g+1)^2/4  - g*sind(phij).^2).*(Mi.^2.*sind(phij)).^2 )./ (g*(Mi.*sind(phij)).^2-(g-1)/2) ./ ((Mi.*sind(phij)).^2 +1) ;
F(9) = atand(2*cotd(phi3).*((M0.*sind(phi3)).^2 - 1)/( M0.^2.*( g + cosd(2*phi3) ) + 2)) - theta3;

F(10) = P3 - P2;
F(11) = theta1 - theta2 - theta3;
F(12) = theta1 - theta2;
end

