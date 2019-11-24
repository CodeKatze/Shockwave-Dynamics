p0 = 1;
g = 1.4;

Mmax = 10;
% M0 = 1.1:0.1:Mmax;
% M0_vn = 2.2:0.1:Mmax;
M0 = 2.84;
M0_vn = 2.84;
theta_detach = [];
theta_vn = [];

options=optimset('TolFun',1e-10,'MaxFunEvals',1000000,'MaxIter',1000000);

guess = [1.1 , 0.5, 1.1, 1.1, 0.1, 0.2, 0.3 ,0.4];
for m = M0
    lb = [0, 0, 0, 0,0.1,0.1,asind(1/m),asind(1/m)];
    ub = [m, m, p0*m*100, p0*m*100,90, 90, 90, 90];
    x = lsqnonlin(@(X)twoShockDetach(X,m,p0,g),guess,lb,ub,options);
%     guess = real(x);
    if imag(x(5)) == 0
        guess = x;
        theta_detach = [theta_detach x(5)];
    else
        theta_detach = [theta_detach 0];
    end       
end
plot(M0,theta_detach);
hold on;

guess = [1.1 , 0.5, 1.1, 1.1, 0.1, 0.2, 0.3 ,0.4];
for m = M0_vn
    lb = [0, 0, 0, 0,0.1,0.1,asind(1/m),asind(1/m)];
    ub = [m, m, p0*m*100, p0*m*100,90, 90, 90, 90];
    x = lsqnonlin(@(X)twoShockVN(X,m,p0,g),guess,lb,ub,options);
%     guess = real(x);
    if imag(x(5)) == 0
        guess = x;
        theta_vn = [theta_vn x(5)];
    else
        theta_vn = [theta_vn 0];
    end       
end
plot(M0_vn,theta_vn);
xlabel('Mach Number, M_0');
ylabel('Deflection Angle, \theta_1');
title('Transition Criteria');
legend('Detachment','von-Neumann');