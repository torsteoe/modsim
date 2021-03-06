clc;
clear;
close all;

theta_deg = 45;
psi_deg = 30;
phi_deg = 60;

theta = deg2rad(theta_deg);
psi = deg2rad(psi_deg);
phi = deg2rad(phi_deg);

% rotation around x-axis
R_x = [1 0          0;
       0 cos(phi)   -sin(phi);
       0 sin(phi)   cos(phi)];
   
R_y = [cos(theta)   0   sin(theta);
       0            1   0;
       -sin(theta)  0   cos(theta)];

R_z = [cos(psi) -sin(psi)   0;
       sin(psi) cos(psi)    0;
       0        0           1];
   
R_ad = R_z*R_y*R_x;

%% Start here, other part is to obtain result for rotation matrix
rotation_matrix = R_ad;

[eigenvector_matrix, eigenvalue_matrix] = eig(rotation_matrix);

% finding axis, eigenvector corresponding with eigenvalue 1
tol = 0.01
for i = 1:size(eigenvector_matrix, 1)
    if abs(1-eigenvalue_matrix(i, i)) < tol
        axis = eigenvector_matrix(1:end,i);
        break
    end
end


%using trace = 2*cos(theta) + 1
trace_rot_mat = trace(rotation_matrix);
axis
theta = acos((trace_rot_mat-1)/2)


%% Alternative way, shown in LF: exam 2006

R = R_ad;

% e = k*sin(theta)

e = 1/2* [R(3,2)-R(2,3);
            R(1,3)-R(3,1);
            R(2,1)-R(1,2)];
% k is a unit vector, so 2-norm of k=1
% e is a unit vector * sin(theta)
theta_alternative= asin(norm(e,2))
k = 1/sin(theta_alternative)*e





