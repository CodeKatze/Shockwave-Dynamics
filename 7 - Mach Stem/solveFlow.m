function y = solveFlow(M0,P0,r0,a0,theta_w,g)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    theta1 = theta_w;
    guess = initialGuess(M0,P0,theta_w,g);
    lb = [0, 0, 0, 0, 0, 0, 0.1, -90, asind(1/M0), asind(1/M0), asind(1/M0)];
    ub = [M0, M0, M0, Inf, Inf, Inf, 90, 90, 90, 90, 90];
    options=optimset('Display','iter','TolFun',1e-10,'TolX',1e-24,'MaxFunEvals',1000000,'MaxIter',1000000);

    x = lsqnonlin(@(X)threeShockTheory(X,M0,P0,theta1,g),guess,lb,ub,options );

    M1 = x(1);
    phi1 = x(9);
    phi2 = x(10);
    phi3 = x(11);
    
    r1 = r0 * ((g+1)*M0^2*sind(phi1)^2 ) / ((g-1)*M0^2*sind(phi1)^2 + 2);
    r2 = r1 * ((g+1)*M1^2*sind(phi2)^2 ) / ((g-1)*M1^2*sind(phi2)^2 + 2);
    r3 = r0 * ((g+1)*M0^2*sind(phi3)^2 ) / ((g-1)*M0^2*sind(phi3)^2 + 2);
    
    a1 = a0 * (sqrt( ((g-1)*(M0*sind(phi1))^2 + 2)*(2*g*(M0*sind(phi1))^2 - (g-1)) )) / ((g+1)*M0*sind(phi1));
    a2 = a1 * (sqrt( ((g-1)*(M1*sind(phi2))^2 + 2)*(2*g*(M1*sind(phi2))^2 - (g-1)) )) / ((g+1)*M1*sind(phi2));
    a3 = a0 * (sqrt( ((g-1)*(M0*sind(phi3))^2 + 2)*(2*g*(M0*sind(phi3))^2 - (g-1)) )) / ((g+1)*M0*sind(phi3));
    
    y = [x r1 r2 r3 a1 a2 a3];
    
end

