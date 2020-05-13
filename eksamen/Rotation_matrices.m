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
   
R_ad = R_z*R_y*R_x