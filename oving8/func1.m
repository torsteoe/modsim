function [outputArg1] = func1(x, y)
%FUNC1 Summary of this function goes here
%   Detailed explanation goes here
outputArg1(1) = x*y-2;
outputArg1(2) = x^4/4 + y^3/3-1;
outputArg1 = outputArg1';
end

