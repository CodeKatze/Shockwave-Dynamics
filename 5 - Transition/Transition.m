p0 = 1;
g = 1.4;

M0 = 1:0.1:5;
phi_detach = [];
phi_vn = [];
for m = M0
    guess = [1 , 1, 1, 1, 0.1, 0.1, 0.1 ,0.1];
    options=optimset('TolFun',.001,'MaxFunEvals',100000,'MaxIter',100000);
    x = fsolve(@(X)eqns_Detach(X,m,p0,g),guess,options);
    phi_detach = [phi_detach real(x(7))];
end
plot(M0,phi_detach);
hold on;
for m = M0
    guess = [1 , 1, 1, 1, 1, 1, 0.1, 0.1, 0.1, 0.1 ,0.1, 0.1];
    options=optimset('TolFun',.001,'MaxFunEvals',10000000,'MaxIter',10000000);
    x = fsolve(@(X)eqns_Vn(X,m,p0,g),guess,options);
    phi_vn = [phi_vn real(x(10))];
end
plot(M0,phi_vn);
% phi = phifromtheta(m,theta_w,gamma);

% [Mj, ~, ~, ~, thetaj] = Shockfun(m,phi,gamma);
