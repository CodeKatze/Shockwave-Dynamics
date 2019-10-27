function [theta_max] = thetaMax(M,g)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
theta =@(phi) -1*atand( 2*cotd(phi).*((M.*sind(phi)).^2 - 1)./(2 + M.^2.*(g+cosd(2*phi))));
options = optimset('MaxFunEvals',500);
[~, theta_max]= fminbnd(theta,asind(1./M),90,options);
end

