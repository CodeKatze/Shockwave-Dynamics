gamma = 1.4;
theta_w = 15;
M0 = 5;
p0 = 1;
alpha_list = [-10 -5 0 5 10];
delta_list = [];
for alpha = alpha_list
    delta = airfoil(M0,p0,alpha,theta_w,gamma);
    delta_list = [delta_list delta];
end

plot(alpha_list,delta_list,'-o');
title('Plot of deflection angle vs Angle of Attack');
xlabel('Angle of Attack');
ylabel('Deflection Angle');