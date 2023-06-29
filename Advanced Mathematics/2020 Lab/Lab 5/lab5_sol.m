%% Lab 5 Adv Maths

close all
clear all
clc

syms x y(x) 

%% 1.1
ode1 = diff(y,x,2) - 3*diff(y,x,1) + 2*y == 0;
sol1 = dsolve(ode1) % C1*exp(x) + C2*exp(2*x)

%% 1.2
ode2 = diff(y,x,2) + 2*diff(y,x,1) + 2*y == 0;
sol2 = dsolve(ode2) % C1*exp(-x)*cos(x) - C2*exp(-x)*sin(x)

%% 1.3
ode3 = diff(y,x,2) + 4*diff(y,x,1) + 4*y == 0;
iv = diff(y,x,1);
sol3 = dsolve(ode3, y(0) == 1, iv(0) == 1) % exp(-2*x)*(3*x + 1)

%% 1.4
ode4 = diff(y,x,2) + 2*diff(y,x,1) - 3*y == 0;
iv = diff(y,x,1);
sol4= dsolve(ode4, y(0) == 1, iv(0) == -1) % exp(-3*x)/2 + exp(x)/2

%% 1.5
ode5 = diff(y,x,2) - 2*diff(y,x,1) + 5*y == 0;
iv = diff(y,x,1);
sol5 = dsolve(ode5, y(0) == 1, iv(0) == -1) % cos(2*x)*exp(x) - sin(2*x)*exp(x)
% or 2^(1/2)*cos(2*x + pi/4)*exp(x)

%% 1.6
ode6 = diff(y,x,2) + 2*diff(y,x,1) + y == 4*x*exp(x);
sol6 = simplify(dsolve(ode6)) % exp(-x)*(C1 - exp(2*x) + x*exp(2*x) + C2*x)
% C1*exp(-x) - (exp(x)*(4*x^2 - 4*x + 2))/2 + C2*x*exp(-x) + x*exp(x)*(2*x - 1)

%% 1.7
ode7 = diff(y,x,2) + y == cos(x);
sol7 = simplify(dsolve(ode7)) % cos(x)/2 + C1*cos(x) - C2*sin(x) + (x*sin(x))/2
% cos(3*x)/8 + (3*cos(x))/8 + sin(x)*(x/2 + sin(2*x)/4) + C1*cos(x) - C2*sin(x)

%% 1.8
ode81 = x*diff(y,x,1) + (x - 1)*y == x^3;
sol81 = simplify(dsolve(ode81)) % x^2 - x + C1*x*exp(-x)
ode82 = -x*diff(y,x,1) + (x - 1)*y == x^3;
sol82 = simplify(dsolve(ode82)) % (x^3 + 3*x^2 + 6*x + 6)/x + (C1*exp(x))/x