%clear all
clc
clf
close all

% Parameters

alpha = 10^-3;
epsilon = 10^-1;

x_0 = [1;1]; z_0 = [1;1];

state_0= [x_0; z_0];
t_span = [0;10];


%[T_out, Y_out] = ode15s(@(t, x)dynamics(t, x, epsilon), t_span, state_0);
figure(1);
hold on;
for k = 1:3
    params = [epsilon, alpha];
    [T_out, Y_out] = ode15s(@(t, x)dynamics(t, x, params), t_span, state_0);
    plot (T_out, Y_out(:, 1));
    epsilon = epsilon^2;
end

%figure(2);

[T_out, Y_out] = ode15s(@(t, x)dynamics2(t, x, params), t_span, x_0);
plot (T_out, Y_out(:, 1));
legend('e=10^-1', 'e=10^-3', 'e=10^-5', 'e=0')


figure();
%title('hei')
epsilon = 10^-1;
alpha = 0;
hold on;
for k = 1:3
    params = [epsilon, alpha];
    [T_out, Y_out] = ode15s(@(t, x)dynamics(t, x, params), t_span, state_0);
    plot (T_out, Y_out(:, 1));
    epsilon = epsilon^2;
end

%figure(2);

[T_out, Y_out] = ode15s(@(t, x)dynamics2(t, x, params), t_span, x_0);
plot (T_out, Y_out(:, 2));
legend('e=10^-1', 'e=10^-3', 'e=10^-5', 'e=0')

