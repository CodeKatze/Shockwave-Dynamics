p0 = 1;
g = 1.4;

M0 = 3;
thetawu_detach = [];
thetawu_VN = [];


theta_wl = 0.1:0.1:thetaMax(M0,g);
options=optimset('TolFun',1e-10,'MaxFunEvals',1000000,'MaxIter',1000000);

guess = [1.1, 0.5, 1.1, 1.1, 0.1, 0.2, 0.3, 0.4, 1.1, 0.5, 1.1, 1.1, 0.11, 0.21, 0.31];

for t = theta_wl
    lb = [0, 0, 0, 0, 0.1, 0.1, asind(1/M0), asind(1/M0), 0, 0, 0, 0, 0.1, asind(1/M0), asind(1/M0)];
    ub = [M0, M0, p0*M0*100, p0*M0*100,90, 90, 90, 90, M0, M0, p0*M0*100, p0*M0*100,90, 90, 90];
    x = lsqnonlin(@(X)twoShockDetach(X,M0,p0,t,g),guess,lb,ub,options);
    %     guess = real(x);
    if imag(x(5)) == 0
        guess = x;
        thetawu_detach = [thetawu_detach x(5)];
    else
        thetawu_detach = [thetawu_detach 0];
    end  
end

plot(theta_wl,thetawu_detach);
hold on;

guess = [1.1, 0.5, 1.1, 1.1, 0.1, 0.2, 0.3, 0.4, 1.1, 0.5, 1.1, 1.1, 0.11, 0.21, 0.31];

for t = theta_wl
    lb = [0, 0, 0, 0, 0.1, 0.1, asind(1/M0), asind(1/M0), 0, 0, 0, 0, 0.1, asind(1/M0), asind(1/M0)];
    ub = [M0, M0, p0*M0*100, p0*M0*100,90, 90, 90, 90, M0, M0, p0*M0*100, p0*M0*100,90, 90, 90];
    x = lsqnonlin(@(X)twoShockVN(X,M0,p0,t,g),guess,lb,ub,options);
    %     guess = real(x);
    if imag(x(5)) == 0
        guess = x;
        thetawu_VN = [thetawu_VN x(5)];
    else
        thetawu_VN = [thetawu_VN 0];
    end  
end

plot(theta_wl,thetawu_VN);
