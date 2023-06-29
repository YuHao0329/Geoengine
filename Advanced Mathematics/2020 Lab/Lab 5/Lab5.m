%% Advance Mathetmatics Lab 5
%% Yu-Hao Chiang 3443130
%% Exercise 1 - Second order linear ODE with constant coefficients
close all
clear all
clc
syms y(x) 
% define  diff(y,x,2) == y'', diff(y,x,1) == y'
Dy = diff(y); % Condition y'(value) = value
%% 1.1
ode1 = diff(y,x,2) - 3*diff(y,x,1) + 2*y == 0;
Sol_1 = dsolve(ode1)
% C1*exp(x) + C2*exp(2*x)
%% 1.2
ode2 = diff(y,x,2) + 2*diff(y,x,1) + 2*y == 0;
Sol_2 = dsolve(ode2)
% C1*exp(-x)*cos(x) - C2*exp(-x)*sin(x)
%% 1.3
ode3 = diff(y,x,2) + 4*diff(y,x,1) + 4*y == 0;
cond3_1 = y(0) == 1;
cond3_2 = Dy(0) == 1;
conds3 = [cond3_1 cond3_2];
Sol_3 = dsolve(ode3, conds3);
Sol_3 = simplify(Sol_3)
% exp(-2*x)*(3*x + 1)
%% 1.4
ode4 = diff(y,x,2) + 2*diff(y,x,1) - 3*y == 0;
cond4_1 = y(0) == 1;
cond4_2 = Dy(0) == -1;
conds4 = [cond4_1 cond4_2];
Sol_4= dsolve(ode4, conds4);
Sol_4 = simplify(Sol_4)
% exp(-3*x)/2 + exp(x)/2
%% 1.5
ode5 = diff(y,x,2) - 2*diff(y,x,1) + 5*y == 0;
cond5_1 = y(0) == 1;
cond5_2 = Dy(0) == -1;
conds5 = [cond5_1 cond5_2];
Sol5(x) = dsolve(ode5, conds5);
Sol_5 = simplify(Sol5)
% 2^(1/2)*cos(2*x + pi/4)*exp(x)
%% 1.6
ode6 = diff(y,x,2) + 2*diff(y,x) + y - 4*x*exp(x) == 0;
Sol_6 = dsolve(ode6);
Sol_6 = simplify(Sol_6)
% exp(-x)*(C1 - exp(2*x) + x*exp(2*x) + C2*x)
%% 1.7
ode7 = diff(y,x,2) + y - cos(x) == 0;
Sol_7 = dsolve(ode7);
Sol_7 = simplify(Sol_7)
% cos(x)/2 + C1*cos(x) - C2*sin(x) + (x*sin(x))/2
%% 1.8
ode8_1 = x*diff(y,x,1) + (x - 1)*y == x^3;
ode8_2 = -x*diff(y,x,1) + (x - 1)*y == x^3;
Sol_8_1 = simplify(dsolve(ode8_1))
% x^2 - x + C1*x*exp(-x)
Sol_8_2 = simplify(dsolve(ode8_2))