%% 2)

close all;
clear;
clc;

lambda = -2000;
x0 = 1;
f = @(t, x) lambda*x;
syms x t;
jac(x) = jacobian(f(t, x), x);

T = 0:0.02:2;
X = ImplicitEulerTemplate(f, jac, T, x0);

plot(T, X);
hold on ;
plot(T, exp(lambda*T));
legend('IRK solution', 'Real solution');