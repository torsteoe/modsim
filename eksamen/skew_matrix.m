function [skew_matrix] = skew_matrix(vec)
%SKEW_MATRIX_OF_VECTOR returns skew symmetric matrix of vector, p.211 eq:
%614
skew_matrix = [0        -vec(3) vec(2);
               vec(3)   0       -vec(1);
               -vec(2)  vec(1)  0];
end

