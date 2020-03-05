clear all
clc

% Parameters
syms m1 m2 L g real
% Force
u = sym('u',[3,1]);

% Positions of point masses
pm1 = sym('pm1',[3,1]);
pm2 = sym('pm2',[3,1]);
dpm1 = sym('dpm1',[3,1]);
dpm2 = sym('dpm2',[3,1]);
ddpm1 = sym('d2pm1',[3,1]);
ddpm2 = sym('d2pm2',[3,1]);
% Generalized coordinates
q  = [pm1;pm2];
dq = [dpm1;dpm2];
ddq = [ddpm1;ddpm2];
% Algebraic variable
z = sym('z');

% Generalized forces
Q = [u; 0; 0; 0];
% Kinetic energy (function of q and dq)
T = 0.5*m1*(dpm1.')*(dpm1) + 0.5*m2*(dpm2.')*(dpm2)  ;
% Potential energy
V = [0 0 m1*g 0 0 m2*g]*q;
% Lagrangian (function of q and dq)
Lag = T-V;
% Constraint
dpm  = pm1 - pm2; % difference of positions
C = 1/2*((dpm.')*dpm -L^2);

% Derivatives of constrained Lagrangian
Lag_q = simplify(jacobian(Lag,q)).';
Lag_qdq = simplify(jacobian(Lag_q.',dq));
Lag_dq = simplify(jacobian(Lag,dq)).';
Lag_dqdq = simplify(jacobian(Lag_dq.',dq)); % W
C_q = simplify(jacobian(C,q)).';

% Matrices for problem 1
M = Lag_dqdq;
b = simplify( Q +Lag_q - Lag_qdq*dq-z*C_q);

disp(b);
disp(M);

% Matrices for problem 2
Mimplicit = [M C_q;
            C_q.' 0];

c = [Q+C_q; C_q.'*ddq ];
Mexplicit = simplify(inv(Mimplicit));
rhs = simplify(Mexplicit*c);
