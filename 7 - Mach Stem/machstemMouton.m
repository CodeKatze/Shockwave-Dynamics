function Hm = machstemMouton(M0,P0,r0,a0,w,H,Ht,theta_w,g)

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


%Geometry
Hm_Hs = 1/M3*(2/(g+1)*(1+(g-1)/2*M3^2))^((g+1)/2/(g-1));
y = solveGeometryMouton(x,w,theta_w,H,Ht,Hm_Hs);
Hm = y(1);

end