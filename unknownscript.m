% Define problem
sigma = 1.2;
f = @(t,u) [-5*u(1)/sigma - u(1)*u(2)/(sigma)+u(3)*u(2)+5*(u(2)^2)/sigma+u(3)/sigma-u(1); 10*u(1)/sigma-u(1)*u(2)/sigma-u(2)*u(3)-10*(u(2)^2)/sigma+u(3)/sigma+u(1);u(1)*u(2)/sigma - u(2)*u(3)- u(3)/sigma+u(1)];
U0 = [.5;.5;.5];
tspan = [0 1];
% Part (a)
k = [2^-10];
% Backward Euler solution
[tvecA,UvecA] = BackwardEulerSys(f,tspan,U0,k);
% Plot part (a) solution:
plot(tvecA,UvecA,'LineWidth',2)
legend('u_1','u_2','u_3')
% Part (b)
k = 2^(-10);
% Leapfrog solution
[tvecB,UvecB] = LeapfrogSys(f,tspan,U0,k);
% Plot part (b) solution:
figure
plot(tvecB,UvecB,'LineWidth',2)
legend('u_1','u_2','u_3')
% Part (c)
k = 2^(-21);
% Leapfrog solution
[tvecC,UvecC] = LeapfrogSys(f,tspan,U0,k);
% Plot part (c) solution:
figure
plot(tvecC,UvecC,'LineWidth',2)
legend('u_1','u_2','u_3')