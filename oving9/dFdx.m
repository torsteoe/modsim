function [dF] = dFdx(x, x_dot, z, t)
%DFDX Summary of this function goes here
%   Detailed explanation goes here
L = 1;
m = 1;
g = 9.81;
Nx = 6;
dF(1:3,1:Nx) = [x(1:3);0;0;0]';
dF(2:4, 1:Nx) =-[0 0 0 1 0 0
                 0 0 0 0 1 0
                 0 0 0 0 0 1];
dF(5:7, 1:Nx) =  -z*[1 0 0 0 0 0
                     0 1 0 0 0 0
                     0 0 1 0 0 0]';
dF(8, 1:Nx) = [x_dot(4:6);2*x(4:6)]';

end

