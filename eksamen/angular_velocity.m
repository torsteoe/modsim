clc;
clear;
close all;
R =[0.61237 0.28033 0.73920;
    0.35355 0.73920 -0.57322;
    -0.70711 0.61237 0.35355];


psi_dot = 1;
theta_dot = 2;
phi_dot = -1;

theta_deg = 45;
psi_deg = 30;
phi_deg = 60;

theta = deg2rad(theta_deg);
psi = deg2rad(psi_deg);
phi = deg2rad(phi_deg);
% page 246 book
omega_a_ad = [-sin(psi)*theta_dot+cos(psi)*cos(theta)*phi_dot;
                cos(psi)*theta_dot+sin(psi)*cos(theta)*phi_dot;
                psi_dot-sin(theta)*phi_dot]