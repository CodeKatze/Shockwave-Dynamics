function  F = geometryRelation(X,M1,MC,M2,MD,MCp,theta3,phi1,phi2,phiC,Hm_Hs,H,w,theta_w,alpha)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

xB = X(1);
yB = X(2);
xC = X(3);
yC = X(4);
xF = X(5);
yF = X(6);
xD = X(7);
yD = X(8);
xT = X(9);
yT = X(10);
xE = X(11);
yE = X(12);
Hm = yT;

muB = asind(1/M1);
xR = w*cosd(theta_w);
yR = H - w*sind(theta_w);
F(1) = yR - tand(muB + theta_w)*(xB - xR) - yB;

muC = asind(1/MC);
F(2) = yR - tand(muC + alpha)*(xC - xR) - yC;

muF = asind(1/M2);
F(3) = yB - tand(muF + theta3)*(xF - xB) - yF;
F(4) = yF - Hm/Hm_Hs;

muD = asind(1/MD);
F(5) = yD - tand(muD)*(xE - xD) - yE;

F(6) = yT + tand(phi2 - theta_w)*(xB - xT) - yB; 
F(7) = xT - (H - Hm)*cosd(phi1);

F(8) = yT - tand(theta3)*(xF - xT) - yF;

% J = @(x,y,x1,y1,x2,y2,d1,d2) ((y-y1)*tand(d1) + (x-x1))^2 * tand(d2-d1) + 2*((x2-x1) + (y2-y1)*tand(d1))*((x-x1)*tand(d1) - (y-y1));
A = @(d1,d2) ((2*tand(d1) + tand(d2-d1))/(2 - tand(d1)*tand(d2-d1)));

dBCb = phi2 - theta_w;
dBCc = phiC - alpha;
F(9) = yC + A(dBCb,dBCc)*(xB -xC) - yB;

dCDc = -1*asind(1/MC);
dCDd = -1*asind(1/MD);
F(10) = yD + A(dCDc,dCDd)*(xC -xD) - yC;

dBDb = theta3;
dBDd = 0;
F(11) = yD + A(dBDb,dBDd)*(xB -xD) - yB;

dFEf = -1*theta3;
dFEe = 0; 
F(12) = yE + A(dFEf,dFEe)*(xF -xE) - yF;

end

