function [tvec,Uvec] = LeapfrogSys(f,tspan,U0,k)
% [tvec,Uvec] = LeapfrogSys(f,tspan,U0,k)
% Leapfrog method
% Inputs
% f: name or function handle of the right-hand side function f:(t,u)->f(t,u)
% tspan(1),U0: initial condition (U0 can be s-vector)
% tspan(2): end time, so that number of steps N = (tspan(2)-tspan(1))/k
% k: stepsize
% Outputs
% tvec: vector of t values
% Uvec: vector (or matrix) of corresponding U values

U0 = U0(:);          % make sure U0 is a column vector
s1 = size(U0);
s = s1(1);     % number of equations in system
tvec = [tspan(1):k:tspan(2)];   % a row vector
N = sum(size(tvec))-1;
Uvec = zeros(s,N);
Uvec(:,1) = U0;
iter = 1;
converged = 1;
tol = 10^(-12);
% Initialize with forward step
V= U0;
fvalue = f(tvec(2),V);
V = Uvec(:,1)+k.*fvalue(:);
Uvec(:,2) = V;
%go into leapfrog method
for n = 2:N-1
    converged =1;
    iter = 1;% time stepping
      while (converged > tol) && (iter < 10) % fixed point iteration to solve implicit problem (don't forget to initialize V and set tolerance tol)
          fvalue = f(tvec(n),V);
          V = Uvec(:,n-1)+2.*k.*fvalue(:);
          if iter > 1
              converged = norm(Vold-V, 'inf');
          end
          Vold = V;
          iter = iter +1;
      end
      Uvec(:,n+1) = V;
end
tvec = tvec';        % to match MATLAB output
Uvec = Uvec';