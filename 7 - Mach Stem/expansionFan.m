function F = expansionFan(X,M1,M2,P1,P2,theta3,theta_w,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

MC = X(1);
MCp = X(2);
MD = X(3);
PC = X(4);
PCp = X(5);
PD = X(6);
phiC = X(7);
thetaCp = X(8);
alpha = X(9);

F(1) = vfromM(MC,g) - vfromM(M1,g) - theta_w - alpha;
F(2) = P1 * ((2 +(g-1)*M1^2)/(2 + (g-1)*MC^2))^(g/(g-1)) - PC;

F(3) = sqrt((1 + (g-1)/2*(MC.*sind(phiC)).^2 )./(g*(MC.*sind(phiC)).^2 - (g-1)/2))./(sind(phiC - thetaCp)) - MCp;
F(4) = 1+ 2*g/(g+1)*((MC.*sind(phiC)).^2 -1) - PCp/PC;
F(5) = atand(2*cotd(phiC).*((MC.*sind(phiC)).^2 - 1)/( MC.^2.*( g + cosd(2*phiC) ) + 2)) - thetaCp;

F(6) = alpha - thetaCp;
F(7) = PCp -PD;

F(8) = vfromM(MD,g) - vfromM(M2,g) - theta3;
F(9) = P2 * ((2 +(g-1)*M2^2)/(2 + (g-1)*MD^2))^(g/(g-1)) - PD;
end

