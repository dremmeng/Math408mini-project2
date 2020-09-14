function [tvec,Uvec] = BackwardEulerSys(f,tspan,U0,k)
% [tvec,Uvec] = BackwardEulerSys(f,tspan,U0,k)
% Backward Euler method
% Inputs
% f: name or function handle of the right-hand side function f:(t,u)->f(t,u)
% tspan(1),U0: initial condition (U0 can be an s-vector)
% tspan(2): end time, so that number of steps N = (tspan(2)-tspan(1))/k
% k: stepsize
% Outputs
% tvec: vector of t values
% Uvec: vector (or matrix) of corresponding u values

U0 = U0(:);          % make sure U0 is a column vector
s = size(f);      % number of equations in system
tvec = (tspan(1):tspan(2));   % a row vector
N = ((tspan(2)-tspan(1))/k);
Uvec = zeros(s,N+1);
Uvec(:,1) = U0;
iter = 1;
converged = 1;
tol 
for n = 1:N
    fvalue = f(tvec(n+1),Uvec(:,n+1));
    V = Uvec(:,n)+k*fvalue(:);
    if iter > 1
        converged = norm(Vold-V,'inf');
        if (converged < tol)
            break
        end
    end
    Vold = V;
    iter = iter+1;
    
end
tvec = tvec';        % to match MATLAB output
Uvec = Uvec';