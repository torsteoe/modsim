function [E] = energy(x)
%ENERGY Summary of this function goes here
%   Detailed explanation goes here
x_d = 1.32;
k = 2.40;
g = 9.81;
m = 200;
Nt = size(x, 2);
E = zeros(1, Nt);
for i=1:Nt
E(i) = ((m*g)/(k-1)*x_d^k/x(1,i)^(k-1)+m*g*x(1,i)+1/2*m*x(2,i));
end
end

