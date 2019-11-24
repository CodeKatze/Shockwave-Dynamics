function  F = geometryRelationMouton(X,M1,M2,theta1,theta3,phi1,phi2,Hm_Hs,Ht,w)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

Hm = X(1);
OT = X(2);
Hs = X(3);
FH = X(4);
EF = X(5);
TH = X(6);
TF = X(7);

mu1 = asind(1/M1);
mu2 = asind(1/M2);
beta = phi2 + theta1;
F(1) = Ht + w*sind(phi1) - OT*sind(phi1) + Hm;
F(2) = Hs + sind(theta3 + mu2)*FH + sind(mu1 + theta1)*EF - Ht;
F(3) = OT*cosd(phi1) + cosd(TH) - cosd(theta3 + mu2)*FH - cosd(mu1 + theta1)*EF - w*cosd(theta1);
F(4) = cosd(phi1)*OT + cosd(beta)*TF - cosd(theta1+mu1)*EF - w*cosd(theta1);
F(5) = sind(phi1)*OT - sind(beta)*TF - sind(theta1+mu1)*EF - w*sind(theta1);
F(6) = cosd(theta3)*TH - cotd(theta3)*(Hm_Hs - 1)*Hs;
F(7) = Hm_Hs*Hs - Hm;

end

