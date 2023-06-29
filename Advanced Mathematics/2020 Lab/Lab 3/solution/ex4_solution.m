%% Ex 4 

clc
clear all
close all

%% Task 1 
 
syms x y z

F1 = [2*x*cos(y) - 2*z^3, 3 + 2*y*exp(z) - x^2*sin(y), y^2*exp(z) - 6*x*z^2]
f1 = potential(F1, [x,y,z])

sprintf("Task 1: The potential function is %s. The field is conservative", f1)

%% Task 2

clear
syms x y z t

F2 = [2*x*z^2*exp(x^2*z) - log(y^2)/x^2, 2/(x*y), (x^2*z + 1) * exp(x^2*z)]
f2 = potential(F2, [x,y,z])

sprintf("Task 2: The potential function is %s. The field is conservative", f2)

% definine the curve C as a straight line joining (1,1,1) to (2,2,2)
r = [t,t,t]
P = subs(r,t,1)
Q = subs(r,t,2)
thint2 = subs(f2, [x,y,z], Q) - subs(f2, [x,y,z], P)

% explicit integration
sub = subs(F2, [x,y,z], r)
diint2 = simplify(int(dot(sub, diff(r,t)), 1, 2))

sprintf("Task 2: The theorem of line integrals sends back %s.", thint2)
sprintf("Task 2: The direct integral sends back %s. The 2nd part is really small, the 2 results are the same.", diint2)

%% Task 3 

clear 
syms x y z

rbar3 = [x, y, 10-x-y]
f3 = x^2 + y^2
length3 = @(u) sqrt(u*u')
mag3 = simplify(length3(cross(diff(rbar3,x),diff(rbar3,y))))
subresult3 = subs(f3, [x,y,z], rbar3)
charge3 = int(int(subresult3*mag3, x, 0, sqrt(1-y^2)), y, 0, 1)

sprintf("Task 3: The total amount of electric charge on the surface is %s.", charge3)

%% Task 4 

clear 
syms x y z

rbar4 = [x, y, x^2+y^2]
F4 = [y,-x,z]
kross4 = simplify(cross(diff(rbar4,x),diff(rbar4,y)))
sub4 = subs(F4, [x,y,z], rbar4)
rate4 = int(int(dot(sub4, kross4), x, 0, 3), y, 0, 3)

sprintf("Task 4: The rate at which the fluid moving through the filter is %s.", rate4)

%% Task 5

clear 
syms x y z

F5 = [x*(y-z), y*(z-x), z*(x-y)]
string_F5 = char(F5)
vpF5 = vectorPotential(F5,[x,y,z])
string_vpF5 = char(vpF5)

sprintf("Task 5: Vector potential of %s is: %s.", string_F5, string_vpF5)

G5 = [x*y, y*z, x*z]
string_G5 = char(G5)
vpG5 = vectorPotential(G5,[x,y,z])
string_vpG5 = char(vpG5)

sprintf("Task 5: Vector potential of %s is: %s.", string_G5, string_vpG5)

%% Task 6 

clear
syms x y z t

F6 = [x*(y-z), y*(z-x), z*(x-y)]
vpF6 = vectorPotential(F6, [x,y,z])
r6 = [cos(t) sin(t) 0]
stokes = int(dot(subs(vpF6, [x y z], r6), diff(r6, t)), t, 0, 2*pi)

sprintf("Task 6: The flux integral by Stokes is %s.", stokes)
