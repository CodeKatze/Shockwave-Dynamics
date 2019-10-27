function delta = airfoil(M0,p0,alpha,theta_w,gamma)

    phi_1u = phifromtheta(M0, theta_w - alpha, gamma);
    phi_1l = phifromtheta(M0, theta_w + alpha, gamma);

    [M1u, p1u_p0, ~, ~, ~] = Shockfun(M0,phi_1u,gamma);
    [M1l, p1l_p0, ~, ~, ~] = Shockfun(M0,phi_1l,gamma);

    p1u = p1u_p0 * p0;
    p1l = p1l_p0 * p0;

    v1u = vfromM(M1u,gamma);
    v1l = vfromM(M1l,gamma);

    v2u = v1u + 2*theta_w;
    v2l = v1l + 2*theta_w;

    M2u = Mfromv(v2u,gamma);
    M2l = Mfromv(v2l,gamma);

    p2u_p1u = ((1 + (gamma-1)/2*M1u^2)/(1 + (gamma-1)/2*M2u^2))^(gamma/(gamma-1));
    p2l_p1l = ((1 + (gamma-1)/2*M1l^2)/(1 + (gamma-1)/2*M2l^2))^(gamma/(gamma-1));

    p2u = p2u_p1u * p1u;
    p2l = p2l_p1l * p1l;

    delta = iterationDelta(M2u,M2l,p2u,p2l,theta_w,gamma,-1*sign(alpha)*0.1);
end

