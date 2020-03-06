function [state_dot] = dynamics(~, state, u)
    x = state(1);
    y = state(2);
    state_dot = zeros(2,1);
    state_dot(1) = y;
    state_dot(2) = u*(1-x*x)*y-x;

end