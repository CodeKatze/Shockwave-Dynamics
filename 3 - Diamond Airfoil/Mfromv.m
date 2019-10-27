function [Mach] = Mfromv(v,g)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

f = @(M) v - sqrt((g+1)/(g-1))*atand(sqrt( (g-1)/(g+1)*(M^2 - 1) )) + atand(sqrt(M^2 - 1));
M_guess = 1;

Mach = fsolve(f,M_guess);
Mach = real(Mach);
end

