function [x_dot] = pneumatic_spring_dynamics(t, x, g, k, x_d) 
    x_dot(1) = x(2);
    x_dot(2) = -g*(1-(x_d/x(1))^k);
    x_dot = x_dot';
end

