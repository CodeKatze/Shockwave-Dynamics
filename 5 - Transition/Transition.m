gamma = 1.4;
M0 = 2;

phi1 = linspace(asind(1/M0),90,100);
[M1, ~, ~, ~, theta1] = Shockfun(M0,phi1,gamma);
for m = M1
    theta2max = thetaMax(m,gamma)
end
% phi = phifromtheta(m,theta_w,gamma);

% [Mj, ~, ~, ~, thetaj] = Shockfun(m,phi,gamma);
