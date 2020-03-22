function [dF] = dFdz(x, x_dot, z, t)
%BIG_F_DFDX Summary of this function goes here
%   Detailed explanation goes here
L = 1;
m = 1;
g = 9.81;
Nx = 6;
Nz = length(z);
dF(1,1) = 0;

dF(2:4, 1) = [0;
                 0;
                 0];
dF(5:7, 1) = -x(1:3);
dF(8, 1) = 0;

end

