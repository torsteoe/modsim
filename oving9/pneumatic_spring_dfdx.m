function [jacobian] = pneumatic_spring_dfdx(t, x, g, k, x_d)
%PNEUMATIC_SPRING_DFDX Summary of this function goes here
%   Detailed explanation goes here
    Nx = length(x);
    jacobian = zeros(Nx);
    jacobian(1, 1) = 0;
    jacobian(1, 2) = 1;
    
    jacobian(2, 2) = 0;
    jacobian(2, 1) = -g*k*x_d^k*(x(1))^(-(k+1));

end

