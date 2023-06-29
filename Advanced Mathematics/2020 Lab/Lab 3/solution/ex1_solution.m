%% Lab 3 Ex 1 

clc 
clear all
close all

syms t

astroid = [cos(t)^3, sin(t)^3]
astroid_area = int(astroid(1)*diff(astroid(2)), t, 0, 2*pi)
ezplot(astroid(1), astroid(2), [0,2*pi])
axis equal
axis([-1,1,-1,1])