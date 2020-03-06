close all;
clear;
clc;
u = 5;
x0 = 2;
y0 = 0;
state0 = [x0;y0];
finalTime = 25;

tspan = [0;finalTime];
[Tout, Yout_ode45] = ode45(@(t, x) dynamics(t, x, u), tspan, state0);







A_4 = [0 0 0 0;
       0.5 0 0 0;
       0 0.5 0 0 ;
       0 0 1 0];
b_4 = [1/6; 1/3; 1/3; 1/6];
c_4 = [0; 1/2; 1/2; 1];


HeunArray_4 = struct('A',A_4,'b',b_4,'c',c_4);

dt = 0.11;

T = 0:dt:finalTime;


X_RK4 =  ERKTemplate(HeunArray_4,@(t,x) dynamics(t, x, u),T,state0, dt);




plot(Tout, Yout_ode45);
hold on;
plot(T, X_RK4);