function x = ERKTemplate(ButcherArray, f, T, x0, dt)
    % Returns the iterations of an ERK method
    % ButcherArray: Struct with the ERK's Butcher array
    % f: Function handle
    %    Vector field of ODE, i.e., x_dot = f(t,x)
    % T: Vector of time points, 1 x Nt
    % x0: Initial state, Nx x 1
    % x: ERK iterations, Nx x Nt
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Define variables
    Nt = size(T,2);
    Nstage = size(ButcherArray.A,2);
    mx = size(x0, 1);
    % Allocate space for iterations (x) and k1,k2,...,kNstage
    x = zeros(Nt, mx);
    % It is recommended to allocate a matrix K for all kj, i.e.
    % K = [k1 k2 ... kNstage]
    K = zeros(Nstage, mx);
    %
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    xt = x0; % initial iteration
    % Loop over time points
    for nt=2:Nt+1
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Update variables
        x(nt-1, :) = xt;
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Loop that calculates k1,k2,...,kNstage
        K(1,:) = f(T(nt-1), xt);
        for nstage=2:Nstage
            K(nstage,:) = f(T(nt-1), xt + dt * ButcherArray.A(nstage, nstage-1)*K(nstage-1,:).');
            %
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % Calculate and save next iteration value x_t
        xt = xt + dt*(K.'*ButcherArray.b);
        %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end