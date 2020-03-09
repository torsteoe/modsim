close all;
clear;
clc;
%% 1a)
x0 = -1;
y0 = -1;

initial_value = [x0;y0];


sol = NewtonsMethodTemplate(@func1, @jacobian1, initial_value, 1e-7); 

iterations = 1:size(sol, 2);
iters = size(sol,2);
vals = zeros(size(initial_value, 1), iters);
for k = 1:iters
    vals(:,k) = func1(sol(:, k));
end
subplot(211)
plot(iterations, sol);
subplot(212)
plot(iterations, vals);

%% 1b


func_b = @(x) (x-1)*(x-2)*(x-3)+1 - (x^3-6*x^2+11*x-5);
syms x;
jac_b = jacobian(func_b, x);
disp(simplify(jac_b));
x0 = 3;
sol = NewtonsMethodTemplate(func_b, jac_b, x0, 1e-7); 

iterations = 1:size(sol, 2);
iters = size(sol,2);
vals = zeros(size(initial_value, 1), iters);
for k = 1:iters
    vals(:,k) = func1(sol(:, k));
end
plot(iterations, vals);