function [v] = vfromM(M,g)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
v = sqrt((g+1)/(g-1))*atand(sqrt( (g-1)/(g+1)*(M^2 - 1) )) - atand(sqrt(M^2 - 1));
end

