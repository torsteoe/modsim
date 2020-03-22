function [F] = Big_f(x, x_dot, z, t)
%BIG_F Summary of this function goes here
%   Detailed explanation goes here
L = 1;
m = 1;
g = 9.81;
F(1) = 1/2*(x(1:3).'*x(1:3) - L^2);
F(2:4) = x_dot(1:3)-x(4:6);
F(5:7) = m*x_dot(4:6) + m*g*[0;0;1]-z*x(1:3);
F(8) = x(1:3).'*x_dot(4:6) + x(4:6).'*x(4:6);
end

