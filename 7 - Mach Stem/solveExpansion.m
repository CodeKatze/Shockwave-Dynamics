function y = solveExpansion(x,theta_w,g)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M1 = x(1);
M2 = x(2);
P1 = x(4);
P2 = x(5);
theta2 = x(7);
theta3 = x(8);
phi2 = x(10);

MC_guess = Mfromv(vfromM(M1,g) + theta_w,g);
MD_guess = Mfromv(vfromM(M2,g) + theta3,g);

guess = [MC_guess, MC_guess, MD_guess, P1, P2, P2, phi2, theta2, theta2];
lb = [0, 0, 0, 0, 0, 0, 0.1, 0.1, 0];
ub = [Inf, Inf, Inf, Inf, Inf, Inf, 90, 90, 90];
options=optimset('Display','iter','TolFun',1e-10,'TolX',1e-24,'MaxFunEvals',1000000,'MaxIter',1000000);

y = lsqnonlin(@(X)expansionFan(X,M1,M2,P1,P2,theta3,theta_w,g),guess,lb,ub,options );

end

