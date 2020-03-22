function [x] = implicit_euler(f, dfdx, T, x0)
%implicit_EULER Returns x-trajectory calculated with implicit euler scheme.

Nx = length(x0);
Nt = length(T);
dt = T(2)-T(1);

x = zeros(Nx, Nt);
xt = x0;
x(:,1) = xt;
for k = 2:Nt
    
    %apply newton
    res = @(xkp1) xkp1-xt-dt*f(T(k), xkp1);
    xt = NewtonsMethod(res, @(x) 1-dt*dfdx(T(k),xkp1), xt);
    x(:,k) = xt;
end


end
