% Problem definition
f = @(t,u) [u(2);u(3);4.*t.^2+8.*t-10-u(3)-4.*u(2)-4.*u(1)];
U0 = [-3;-2;2];
tspan = [0 5];
utrue = @(t) [-sin(2.*t)+t.^(2)-3; 2.*t-2.*cos(2.*t);2+4.*sin(2.*t)];   % exact solution

% Part (b)
k = 0.1;
% Compute Backward Euler solution
[tvec,Uvec] = BackwardEulerSys(f,tspan,U0,k);
% True solution at same points as approximate solution
tvec = [tspan(1):k:tspan(2)];
utvec = transpose(utrue(tvec));
% Error plot for k=0.1:
EvecB = abs(Uvec(:,1) - utvec(:,1));
figure
plot(tvec,EvecB)
% Error at t=5
error5B = abs(utvec(51,1)-Uvec(51,1))

% Part (c)
k = 0.001;
% Compute Backward Euler solution
[tvec,Uvec] = BackwardEulerSys(f,tspan,U0,k);
% True solution at same points as approximate solution
tvec = [tspan(1):k:tspan(2)];
utvec = transpose(utrue(tvec));
% Error plot for k=0.001:
EvecC = abs(Uvec(:,1) - utvec(:,1));
figure
plot(tvec,EvecC)
% Error at t=5
error5C = abs(utvec(5001,1)-Uvec(5001,1))