close all;
clear;
clc;

%% Gauss-Legendre collocation

b = [1/2; 1/2];
c = [1/2-sqrt(3)/6; 1/2+sqrt(3)/6];
A = [1/4, 1/4 - sqrt(3)/6;
    1/4 + sqrt(3)/6, 1/4];

ButcherArray = struct('A', A, 'b', b, 'c', c);
lambda = -2;
x0 = 1;
tf = 2;
T = 0:0.4:tf;
f = @(t, x) lambda*x;
dfdx = @(t, x) lambda;

x = IRKTemplate(ButcherArray, f, dfdx, T, x0);

f1 = figure();
movegui(f1, 'west');

plot(T, x);
hold on;
T_real = 0:0.0004:tf;
plot(T_real, exp(lambda*T_real));
legend('G-L collocation', 'exp(lambda*T)');
title('x_{dot} = lambda*x');


movegui(f1, 'west');
