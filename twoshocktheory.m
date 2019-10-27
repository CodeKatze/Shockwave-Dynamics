p0 = 1; % In atm
T0 = 300;% In Kelvin
u0 = 800;
thetaw = 5;

g = 1.4;
R = 287;

M0 = u0/sqrt(g*R*T0);
phi1 = phifromtheta(M0, thetaw, g);

[M1, p1_p0, rho1_rho0] = Shockfun(M0,phi1,g);

phi2 = phifromtheta(M1, thetaw, g);
[M2, p2_p1, rho2_rho1] = Shockfun(M1,phi2,g);