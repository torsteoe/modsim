function [x_dot] = dynamics2(~, state)
%DYNAMICS Summary of this function goes here
%   Detailed explanation goes here
alpha = 10^-3;
x =  [state(1);state(2)];


A1 = [1 1;
     0 1];
 
A = [x(1)^2 x(2);
    0   x(2)^2] + alpha*eye(2);

x_dot = -A1*x-(1/10)*A\x;


end



