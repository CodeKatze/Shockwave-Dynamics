function y = solveGeometryMouton(x,w,theta_w,H,Ht,Hm_Hs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M1 = x(1);
M2 = x(2);
M3 = x(3);
theta1 = theta_w;
theta3 = x(8);
phi1 = x(9);
phi2 = x(10);


guess = [Ht/4,Ht/2,Ht/4,Ht/3,Ht/3,Ht/3,Ht/3];
lb = [0.1,0.1,0.1,0.1,0.1,0.1,0.1];
ub = [H, H/sind(theta_w), H, H/sind(theta_w), H/sind(theta_w), H/sind(theta_w), H/sind(theta_w)];
options=optimset('Display','iter','TolFun',1e-10,'TolX',1e-24,'MaxFunEvals',1000000,'MaxIter',1000000);

y = lsqnonlin(@(X)geometryRelationMouton(X,M1,M2,theta1,theta3,phi1,phi2,Hm_Hs,Ht,w),guess,lb,ub,options );

end

