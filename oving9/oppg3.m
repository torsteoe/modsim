close all;
clear;
clc;
%% 1a

x0 = [1;0;0;0;1;0];
z0_est = 1;

dt = 0.01;
tf = 30;
T = 0:dt:tf;

b = [1/2; 1/2];
c = [1/2-sqrt(3)/6; 1/2+sqrt(3)/6];
A = [1/4, 1/4 - sqrt(3)/6;
    1/4 + sqrt(3)/6, 1/4];
ButcherArray = struct('A', A, 'b', b, 'c', c);

p = sym('p', [3, 1]);
v = sym('v', [3, 1]);
dp = sym('dp', [3, 1]);
dv = sym('dv', [3, 1]);

x = [p;v];
dx = [dp;dv];
t = sym('t');
z = sym('z');
L = 1;
m = 1;
g = 9.81;
%     1/2*((p.')*p -L^2)
F_symbolic =   [dp-v; 
                m*dv + m*g*[0;0;1] + z*p;
                (p.')*dv + (v.')*v];
dFdx_symbolic = jacobian(F_symbolic, x);
dFdxdot_symbolic = jacobian(F_symbolic, dx);
dFdz_symbolic = jacobian(F_symbolic, z);

F = matlabFunction(F_symbolic, 'vars', { dx,x, z, t});
dFdx = matlabFunction(dFdx_symbolic, 'vars', { dx,x, z, t});
dFdxdot = matlabFunction(dFdxdot_symbolic, 'vars', { dx,x, z, t});
dFdz = matlabFunction(dFdz_symbolic, 'vars', { dx,x, z, t});



[x,xdot,z] = RKDAE(ButcherArray,F, dFdxdot, dFdx, dFdz, T, x0, z0_est);
f1 = figure();
movegui(f1, 'north');
plot3(x(1,:), x(2,:), x(3,:));

% Plot constraints
constraint = @(p) 1/2*(p.'*p -L^2);
C = zeros(1, length(T));
for i = 1:length(T)
    C(i) = constraint(x(1:3, i));
end
f2 = figure();
movegui(f2, 'east');
plot(T, C);

%% 3b Model obtained directly from Lagrange

x0 = [1;0;0;0;1;0];
z0_est = 1;

dt = 0.1;
tf = 30;
T = 0:dt:tf;

b = [1/2; 1/2];
c = [1/2-sqrt(3)/6; 1/2+sqrt(3)/6];
A = [1/4, 1/4 - sqrt(3)/6;
    1/4 + sqrt(3)/6, 1/4];
ButcherArray = struct('A', A, 'b', b, 'c', c);

p = sym('p', [3, 1]);
v = sym('v', [3, 1]);
dp = sym('dp', [3, 1]);
dv = sym('dv', [3, 1]);

x = [p;v];
dx = [dp;dv];
t = sym('t');
z = sym('z');
L = 1;
m = 1;
g = 9.81;
%     
F_symbolic_lag =   [dp-v; 
                m*dv + m*g*[0;0;1] + z*p;
                1/2*((p.')*p - L^2)];
dFdx_symbolic_lag = jacobian(F_symbolic_lag, x);
dFdxdot_symbolic_lag = jacobian(F_symbolic_lag, dx);
dFdz_symbolic_lag = jacobian(F_symbolic_lag, z);

F_lag = matlabFunction(F_symbolic_lag, 'vars', { dx,x, z, t});
dFdx_lag = matlabFunction(dFdx_symbolic_lag, 'vars', { dx,x, z, t});
dFdxdot_lag = matlabFunction(dFdxdot_symbolic_lag, 'vars', { dx,x, z, t});
dFdz_lag = matlabFunction(dFdz_symbolic_lag, 'vars', { dx,x, z, t});



[x_lag,xdot_lag,z_lag] = RKDAE(ButcherArray,F_lag, dFdxdot_lag, dFdx_lag, dFdz_lag, T, x0, z0_est);
f2 = figure();
movegui(f2, 'west');
plot3(x_lag(1,:), x_lag(2,:), x_lag(3,:));
