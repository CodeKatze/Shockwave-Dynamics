function Hm = machstem(M0,P0,r0,a0,w,H,L,Ht,theta_w,g)

%Triple Point
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
a1 = x(15);
a2 = x(16);
a3 = x(17);

%Mach Stem Base
Mg = sqrt((1 + (g-1)/2*(M0)^2 )/(g*(M0)^2 - (g-1)/2));
Pg = P0 * ( 1+ 2*g/(g+1)*((M0)^2 - 1));
rg = r0 * ((g+1)*M0^2 ) / ((g-1)*M0^2 + 2);
ag = a0 * (sqrt( ((g-1)*M0^2 + 2)*(2*g*M0^2 - (g-1)) )) / ((g+1)*M0);

u3 = M3*a3;
ug = Mg*ag;

%Subsonic Patch
r_bar = 0.5*(rg + r3);
a_bay = 0.5*(ag + a3);
M_bar = 2*(r3*u3*cosd(theta3) + rg*ug)/(r3 + rg)/(a3 + ag);
Hm_Hs = 1/M_bar*(2/(g+1)*(1+(g-1)/2*M_bar^2))^((g+1)/2/(g-1));

%Expansion Fan Interaction
y = solveExpansion(x,theta_w,g);
MC = y(1);
MCp = y(2);
MD = y(3);
PC = y(4);
PCp = y(5);
PD = y(6);
phiC = y(7);
thetaCp = y(8);
alpha = y(9);

%supersonic patch
z = solveSupersonic(x,y,w,H,L,Ht,Hm_Hs,theta_w);
xB = z(1);
yB = z(2);
xC = z(3);
yC = z(4);
xF = z(5);
yF = z(6);
xD = z(7);
yD = z(8);
xT = z(9);
Hm = z(10);
xE = z(11);
yE = z(12);

end