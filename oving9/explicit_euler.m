function [x] = explicit_euler(f, T, x0)
%EXPLICIT_EULER Returns x-trajectory calculated with explicit euler scheme.

Nx = length(x0);
Nt = length(T);
dt = T(2)-T(1);

x = zeros(Nx, Nt);
xt = x0;
x(:,1) = xt;
for k = 2:Nt
    xt = xt + dt*f(T(k), xt);
    x(:,k) = xt;
end


end

