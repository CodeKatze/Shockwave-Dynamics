function [delta] = iterationDelta(Mu,Ml,pu,pl,theta_w,gamma,guess)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

delta = guess;
thetau = theta_w - delta;
thetal = theta_w + delta;

phi_u = phifromtheta(Mu,thetau,gamma);
phi_l = phifromtheta(Ml,thetal,gamma);

[~, pj_piu, ~, ~, ~] = Shockfun(Mu,phi_u,gamma);
[~, pj_pil, ~, ~, ~] = Shockfun(Ml,phi_l,gamma);

pu_ = pj_piu * pu;
pl_ = pj_pil * pl;
    
while abs(pu_ - pl_)> 1.0e-5
    
    thetau = theta_w - delta;
    thetal = theta_w + delta;

    phi_u = phifromtheta(Mu,thetau,gamma);
    phi_l = phifromtheta(Ml,thetal,gamma);

    [~, pj_piu, ~, ~, ~] = Shockfun(Mu,phi_u,gamma);
    [~, pj_pil, ~, ~, ~] = Shockfun(Ml,phi_l,gamma);

    pu_ = pj_piu * pu;
    pl_ = pj_pil * pl;

    delta = delta - (pl_-pu_)*0.1;
end

end

