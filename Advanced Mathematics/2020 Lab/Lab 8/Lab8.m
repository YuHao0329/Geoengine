%% Advance Mathematics Lab 8
%% Yu-Hao Chiang 3443130
%% Ex 2 - Numerical Integration in Matlab
close all
clear all
clc
% Prepare the data
fxy = @(x,y) x * y;
x0 = 0;
xmax = 6;
y0 = [0.35502805388; 0.2588194079]; % [y0; diff(y0)]
h = 0.01;
[X, Y1] = RungeKutta4(fxy, x0, h, xmax, y0);

Y2 = zeros(2, 601);
[X, Y2] = ode45(@myode, 0:0.01:6, [0.35502805388; 0.2588194079]);
figure
box on
plot(X,Y2(:,1))
grid on
title('ode check')

function dy = myode(x, y)
dy = zeros(2,1);
% y = y(1) yp = y(2)
dy(1) = y(2);
dy(2) = -x * y(1);
end

function [X, Y] = RungeKutta4(fxy, x0, h, xmax, y0)

% Using RungeKutta4 to find the approximate 
%
% How [X, Y] = RungeKutta4(fxy, x0, h, xmax, y0)
% IN
%     fxy    - the function fxy represent the ODE  [diff(y);diff(y,2)] = [0 1;-x 0] * [y;diff(y)]
%     x0     - x initial value      
%     h      - stepwidth                              
%     xmax   - x maximum value                                
%     y0     - [y0; diff(y0)]                        
%
% OUT
%       X    - the approximate value                     
%       Y    - the approximate value                                 
%
% -------------------------------------------------------------------------
% Yu-Hao Chiang, University of Stuttgart                    13/1/2021
% -------------------------------------------------------------------------
%
% Here we go
x = x0:h:xmax;
y = y0(1);
yp = y0(2);
Y = zeros(2, length(x));
for i = 1:601
    Xv(i) = x(i);
    Yv(i) = y;
    Ypv(i) = yp;
    
    X = [0 1;-x(i) 0];
    Y(:,i) = [Yv(i); Ypv(i)];
    
    k1 = fxy(X,Y);
    k2 = fxy(X+[0 0;-0.5*h 0],Y+0.5*h*k1);
    k3 = fxy(X+[0 0;-0.5*h 0],Y+0.5*h*k2);
    k4 = fxy(X+[0 0;-h 0],Y+h*k3);
    
    Y = Y + h/6 * (k1+2*k2+2*k3+k4);
    y = Y(1);
    yp = Y(2);
end
figure
box on
plot(Xv, Yv)
grid on
title('Runge-Kutta method of order 4')
end