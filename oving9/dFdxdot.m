function [dF] = dFdxdot(x, x_dot, z, t)
%BIG_F_DFDX Summary of this function goes here
%   Detailed explanation goes here
L = 1;
m = 1;
g = 9.81;
Nx = 6;

dF(1,1:Nx) = zeros(Nx, 1)';
dF(2:4, 1:Nx) = [1 0 0 0 0 0
                 0 1 0 0 0 0
                 0 0 1 0 0 0];
dF(5:7, 1:Nx) = m*[0 0 0 1 0 0
                 0 0 0 0 1 0
                 0 0 0 0 0 1];
dF(8, 1:Nx) = [x(1:3);0;0;0]';
end

