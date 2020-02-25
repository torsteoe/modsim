function [state_dot] = dynamics(~, state, epsilon)
%DYNAMICS Summary of this function goes here
%   Detailed explanation goes here
alpha = 10^-3;
x =  [state(1);state(2)];
z = [state(3); state(4)];


A1 = [1 1;
     0 1];
 
A = [x(1)^2 x(2);
    0   x(2)^2] + alpha*eye(2);
x_dot = -A1*x-z;


z_dot = (1/10*x -A*z)/epsilon;
state_dot = [x_dot;z_dot];
end

