%% AdvMath Lab 12
%% Yu-Hao Chiang 3443130 
%% add your name and student ID
close all
clear all
clc
% preparation data
Halemaumau = importdata('Halemaumau.txt');
x = Halemaumau(:,1);
y = Halemaumau(:,2);
% x^2 + y^2 + ax + by + c = 0 (circle equation)
% -(x^2 + y^2) = ax + by + c
% Least square criterion
A = [x y ones(65,1)];
Y = [-(x.^2 + y.^2)];
x_hat = inv(A'*A) * A' * Y;  
Y_hat = A * x_hat;
% misfit vector
e_hat = Y - Y_hat; 
% misfit function
E = e_hat'* e_hat;

% (x - x0)^2 + (y - y0)^2 = r^2
x0 = -x_hat(1)/2;
y0 = -x_hat(2)/2;
r = sqrt(-x_hat(3) + x0^2 + y0^2);

% estimate the area
a = polyarea(x,y);

% plot the result
figure
axis equal
hold on
plot(x, y, 'k')
circle(x0, y0, r)
plot(x0, y0, '*')
title('The rim of the Halemaumau crater')
legend('Orginal shape', 'circle')


function circle(x0,y0,r)
% x0 and y0 are the coordinates of the center of the circle
% r is the radius of the circle
% 0.01 is the angle step, bigger values will draw the circle faster but
% we might notice imperfections (not very smooth)
ang = 0:0.01:2*pi; 
xp = r * cos(ang);
yp = r * sin(ang);
plot(x0 + xp, y0 + yp);
end





