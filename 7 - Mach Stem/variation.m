M0 = 2.84;
P0 = 1;
r0 = 1.225;
a0 = 330;
g = 1.4;

w = 10;
Ht_L = 0.37;

% phi = 38.2:0.25:41.5;
% theta = atand(2*cotd(phi).*((M0*sind(phi)).^2 - 1)./( M0^2*( g + cosd(2*phi) ) + 2));

theta = 19.2:0.5:25;
% theta = 20;

Hm = zeros(size(theta));
Hm_L = zeros(size(theta));

Hm_mout = zeros(size(theta));
Hm_L_mout = zeros(size(theta));

for i = 1:length(theta)
    theta_w = theta(i);
    L = w * cosd(theta_w);
    Ht = Ht_L * L;
    H = Ht + w*sind(theta_w);
    
%     Hm(i) = machstem(M0,P0,r0,a0,w,H,L,Ht,theta_w,g);
%     Hm_L(i) = Hm(i)/L;
    
    Hm_mout(i) = machstemMouton(M0,P0,r0,a0,w,H,Ht,theta_w,g);
    Hm_L_mout(i) = Hm_mout(i)/L;
end

% plot(theta, Hm_L);
% title("H_m/L vs Wedge Angle using Li and Ben-Dor's Method");
% xlabel('Wedge Angle, \theta_w');
% ylabel('H_m/L');

plot(theta, Hm_L_mout);
title("H_m/L vs Wedge Angle using Mouton's Method");
xlabel('Wedge Angle, \theta_w');
ylabel('H_m/L');

% plot(theta, Hm_L);
% hold on;
% plot(theta, Hm_L_mout);
% title("Comparison between Li and Ben-Dor's Method and Mouton's method");
% xlabel('Wedge Angle, \theta_w');
% ylabel('H_m/L');

% plot(phi, Hm_L);
    