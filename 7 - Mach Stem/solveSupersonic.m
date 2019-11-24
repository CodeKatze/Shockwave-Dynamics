function y = solveSupersonic(x,y,w,H,L,Ht,Hm_Hs,theta_w)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M1 = x(1);
M2 = x(2);
P1 = x(4);
P2 = x(5);
theta3 = x(8);
phi1 = x(9);
phi2 = x(10);

MC = y(1);
MCp = y(2);
MD = y(3);
phiC = y(7);
alpha = y(9);

guess = [1.25*L,Ht/2,1.25*L,Ht/2,1.5*L,Ht/4,1.5*L,Ht/2,L,Ht/2,2*L,Ht/4];
lb = [0.1,0.1,0.1,0.1,0.1,0,0.1,0.1,0.1,0,0.1,0];
ub = [Inf, H, Inf, H, Inf, H, Inf, H, Inf, H, Inf, H];
options=optimset('Display','iter','TolFun',1e-10,'TolX',1e-24,'MaxFunEvals',1000000,'MaxIter',1000000);

y = lsqnonlin(@(X)geometryRelation(X,M1,MC,M2,MD,MCp,theta3,phi1,phi2,phiC,Hm_Hs,H,w,theta_w,alpha),guess,lb,ub,options );

end

