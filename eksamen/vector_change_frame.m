clear;
clc;
close all;
R_ba = [sqrt(3)/2   1/2     0;
        -1/2      sqrt(3)/2  0;
        0       0       1];
R_ab = R_ba';
r_frame_a = [1/2; 1/3; 0];

r_ab_frame_a = [4;3;0]; % vector of relative position, just distance between two vectors.

T_ab = [R_ab    r_ab_frame_a;
        0 0 0   1];
%T_ba = inv(T_ab);
T_ba = [R_ba    -R_ba*r_ab_frame_a;     %negative sign because we are looking at vector_ba not ab, multiply with R_ba to put in frame b. 
        0 0 0      1];



p_frame_a = [r_frame_a; 1];
p_frame_b = T_ba*[p_frame_a];

r_frame_b = p_frame_b(1:3);