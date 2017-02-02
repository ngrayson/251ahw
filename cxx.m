function [cxxm] = cxx(m,x,N)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
cxxm = 0;
for n = 1:(N-m)
    cxxm = cxxm + x(n)*x(n+m);   
end
% cxxm=cxxm/N;
% return cxxm;

end

