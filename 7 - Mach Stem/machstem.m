M0 = 2.8;
theta_w = 22;
P0 = 1;
r0 = 1.225;
a0 = 330;
g = 1.4;

Ht_L = 0.37;

x = solveFlow(M0,P0,r0,a0,theta_w,g);

M1 = x(1);
M2 = x(2);
M3 = x(3);
P1 = x(4);
P2 = x(5);
P3 = x(6);
theta1 = theta_w;
theta2 = x(7);
theta3 = x(8);
phi1 = x(9);
phi2 = x(10);
phi3 = x(11);
r1 = x(12);
r2 = x(13);
r3 = x(14);

Mg = sqrt((1 + (g-1)/2*(M0)^2 )/(g*(M0)^2 - (g-1)/2));
Pg = P0 * ( 1+ 2*g/(g+1)*((M0)^2 - 1));
rg = r0 * ((g+1)*M0^2 ) / ((g-1)*M0^2 + 2);
ag = a0 * (sqrt( ((g-1)*M0^2 + 2)*(2*g*M0^2 - (g-1)) )) / ((g+1)*M0);

