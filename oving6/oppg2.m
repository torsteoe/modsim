%clear all
clc
clf

% Parameters

alpha = 10^-3;

x_0 = [1;1]; z_0 = [1;1];

state_0= [x_0; z_0];
t_span = [0;10];


%[T_out, Y_out] = ode15s(@(t, x)dynamics(t, x, epsilon), t_span, state_0);

% for k = 1:3
%     hold on;
%     [T_out, Y_out] = ode15s(@(t, x)dynamics(t, x, epsilon), t_span, state_0);
%     plot (T_out, Y_out(:, 1));
%     epsilon = epsilon^2;
% end


hold on;
[T_out, Y_out] = ode15s(@dynamics2, t_span, x_0);
plot (T_out, Y_out(:, 1:2));
