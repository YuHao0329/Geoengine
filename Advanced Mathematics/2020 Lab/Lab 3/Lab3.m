%% AdvMath Lab 3
%% Yu-Hao Chiang 3443130
close all
clear all
clc
%% Ex1.2
syms u v x y t
u = cos(t);
v = sin(t);
x = u^3;
y = v^3;

T = [diff(x,t); diff(y,t)];

s_diff = sqrt(T'*T);
s_0_pi2 = int(s_diff, t, 0, pi/2);
s_full = double(s_0_pi2 * 4);

% theta = 0 : pi/100 : 2*pi;
% x_track = double(subs(x, t, theta));
% y_track = double(subs(y, t, theta));
% plot(x_track, y_track) 
A = 4 * ( 1/2 * ( int(x*diff(y), t, 0, pi/2) - int(y*diff(x), t, 0, pi/2) ) );
%% Ex1.3
t = 0: pi/100 : 2*pi;
n = 0: 0.01 : 2;

figure(1)
hold on
for i = 1: 201
    plot3((cos(t).^3 + n(i)), (sin(t).^3 + n(i)), n(i).*ones(1,201))
end
%% Ex2.1
% The boundary of a cone
figure(2)
phi = 0 : 0.01*pi : 2*pi;
rho = (cos(phi)-sin(phi))./(4 + sin(phi).*cos(phi));
polarplot(phi, rho)

figure(3)
plot(phi, rho)
hold on
xline(pi,'r')
xlabel('\phi')
ylabel('\rho')
%% Ex3
clear 
syms r lambda theta
G = [0, r*cos(lambda), 0];
N = [sin(theta), 0, 0];
dot(curl(G, [r lambda theta]), N);
a = [1 0 0];
b = [0 3/5 4/5];
c = [0 0 1];
v = [a;b;c];
figure(4)
plot3([v(1,1) v(2,1)], [v(1,2) v(2,2)], [v(1,3) v(2,3)],'k')
hold on
plot3([v(1,1) v(3,1)], [v(1,2) v(3,2)], [v(1,3) v(3,3)],'k')
plot3([v(3,1) v(2,1)], [v(3,2) v(2,2)], [v(3,3) v(2,3)],'k')


%% Ex4 - Integral Theorems on Matlab
%% Part1: Fundamental Theorem of Line Integrals
% Task 1
clear 
syms x y z t
F_1 = [2*x*cos(y) - 2*z^3;
     3 + 2*y*exp(z) - x^2*sin(y);
     y^2*exp(z) - 6*x*z^2];
f_1 = potential(F_1, [x; y; z])

% Task 2
F_2 = [2*x*z^2*exp(x^2*z) - log(y^2)/x^2;
     2 / (x*y);
     (x^2*z + 1) * exp(x^2*z)];
f_2 = potential(F_2, [x; y; z]);
r = [t; t; t];
P = subs(r, t, 1);
Q = subs(r, t, 2);
subs(f_2, [x;y;z], Q) - subs(f_2, [x;y;z], P)

sub = subs(F_2, [x; y; z], r);
simplify(int(dot(sub, diff(r,t)), 1, 2))

%% Part 2: Surface Integrals of Functions
% Task 3
clear 
syms x y z
rbar = [x, y, 10-x-y];
f = x^2 + y^2;
arclength = @(T) sqrt(T*T');
mag = simplify(arclength(cross(diff(rbar, x), diff(rbar, y))));
subresult = subs(f, [x, y, z], rbar);
int(int(subresult * mag, x, 0, sqrt(1-y^2)), y, 0, 1)

%% Part 3: Surface Integrals of Vector Fields
% Task 4
clear 
syms x y z 
rbar = [x, y, x^2 + y^2];
F_4 = [y, -x, z];
kross = simplify(cross(diff(rbar,x),diff(rbar,y)));
sub = subs(F_4, [x, y, z], rbar);
int(int(dot(sub, kross), x, 0, 3), y, 0, 3)

%% Part 4: Stoke's Theorem
% Task 5
clear 
syms x y z
F_5 = [x*(y-z), y*(z-x), z*(x-y)];
vectorPotential(F_5, [x, y, z])
G_5 = [x*y, y*z, x*z];
vectorPotential(G_5, [x, y, z])

% Task 6
clear
syms x y z t
F_6 = [x*(y-z), y*(z-x), z*(x-y)];
A_6 = vectorPotential(F_6, [x, y, z]);
r_6 = [cos(t) sin(t) 0];
int(dot(subs(A_6, [x y z], r_6), diff(r_6, t)), t, 0, 2*pi)




