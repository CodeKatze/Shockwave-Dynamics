function [Mj, pj_pi, rhoj_rhoi, tj_ti, thetaj] = Shockfun(Mi,phij,g)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Mj = sqrt( (1 + (g-1)*(Mi*sind(phij))^2 + ( (g+1)^2/4 - g*sind(phij)^2 )*(Mi^2*sind(phij))^2)/(g*(Mi*sind(phij))^2 - (g-1)/2) / ((Mi*sind(phij))^2 +1) );
pj_pi = 2/(g+1)*(g*(Mi*sind(phij))^2 - (g-1)/2);
rhoj_rhoi = ( (g+1)*(Mi*sind(phij))^2 )/( (g-1)*(Mi*sind(phij))^2 +2 );
tj_ti = ( (g-1)*(Mi*sind(phij))^2 + ( (g+1)^2/4  - g*sind(phij)^2)*(Mi^2*sind(phij))^2 )/ (g*(Mi*sind(phij))^2-(g-1)/2) / ((Mi*sind(phij))^2 +1) ;
thetaj = atand(2*cotd(phij)*((Mi*sind(phij))^2 - 1)/( Mi^2*( g + cosd(2*phij) ) + 2));
end

