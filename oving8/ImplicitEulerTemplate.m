function x = ImplicitEulerTemplate(f, dfdx, T, x0)
    % Returns the iterations of the implicit Euler method
    % f: Function handle
    %    Vector field of ODE, i.e., x_dot = f(t,x)
    % dfdx: Function handle
    %       Jacobian of f w.r.t. x
    % T: Vector of time points, 1 x Nt
    % x0: Initial state, Nx x 1
    % x: Implicit Euler iterations, Nx x Nt
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Define variables
    % Allocate space for iterations (x)
    x = zeros(size(x0, 1), size(T,2));
    Nt = size(T, 2);
    %
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xt = x0; % initial iteration
    % Loop over time points
    dt = T(2)-T(1);
    x(1) = xt;
    for nt=2:Nt
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Update variables
        % Define the residual function for this time step
        res_f = @(x_kp1) xt+dt*f(nt, x_kp1)-x_kp1;

        jac_res_f = dfdx - eye(size(xt, 2));
        
        % Define the Jacobian of this residual
        % Call your Newton's method function
        sol = NewtonsMethodTemplate(res_f, jac_res_f, xt);
        xt = sol(size(sol,2));
        x(nt)=xt;
        % Calculate and save next iteration value xt
        %
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end