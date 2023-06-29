clear all
close all
clc

syms x y z t
%% Task 1
F = [2*x*cos(y) - 2*z^3;
     3 + 2*y*exp(z) - x^2*sin(y);F = [2*x*z^2*exp(x^2*z) - log(y^2)/x^2;
     2 / (x*y);
     (x^2*z + 1) * exp(x^2*z)];

f = potential(F, [x; y; z]);
P = subs(f, [x; y; z], [1; 1; 1]);
Q = subs(f, [x; y; z], [2; 2; 2]);
C_int = Q - P;

r = [t; t; t];
sub = subs(F, [x; y; z], r);
direct_int = simplify(int(dot(sub, diff(r)), 1, 2));
     y^2*exp(z) - 6*x*z^2];
f = potential(F, [x; y; z]);

%% Task 2


%% Task 3
%x = cos(t);
%dx = -sin(t)dt
%y = sin(t);
%dy = cos(t)dt
% rbar = [x, y, x^2+y^2];
rbar = [cos(t), sin(t), 10-cos(t)-sin(t)];
% f = x*y;
f = x^2 + y^2;
mylength = @(u) sqrt(u*u');
% mag = simplify(mylength(cross(diff(rbar, x), diff(rbar, y))));
mag = simplify(mylength(cross(diff(rbar/(-sin(t)), t), diff(rbar/cos(t), t))));
subresult = subs(f, [x, y, z], rbar);
% int(int(subresult * mag, x, 0, 2), y, 0, 3)
int(subresult * mag, t, 0, pi/2)

%% Task 4


%% Task 5


%% Task 6
