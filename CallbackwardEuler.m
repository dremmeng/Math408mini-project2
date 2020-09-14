% Define problem
f = @(t,u) [u(2); -9.81/2*sin(u(1))];
U0 = [1;0];
tspan = [0 2*pi];
% Pick time step
k = 0.1;
% Call function
[tvec, Uvec] = BackwardEulerSys(f,tspan,U0,k); 
