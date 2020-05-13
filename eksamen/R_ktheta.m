clear;
clc;
close all;

% Using equation 6.147

k = [1/2; 0; sqrt(3)/2];
theta_deg = 60;
theta = deg2rad(theta_deg);
%theta = pi/3;
R_k_theta = eye(3) + skew_matrix(k)*sin(theta) + skew_matrix(k)*skew_matrix(k)*(1-cos(theta));

% Alternative is using equation 6.142