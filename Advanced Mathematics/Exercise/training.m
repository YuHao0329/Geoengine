close all
clear all
clc
u1 = [1; 2; 3];
u2 = [-5; 2; 1];
u3 = [-1; -3; 7];
A = [2 3 4; 7 6 5; 2 8 7];
sol1 = u1 + 3*u2 - u3/5
sol2 = dot(u1, u2)
sol3 = A * u1

D = [16 3 2 13;
    5 10 11 8;
    9  6  7 2;
    4 15 14 1];
DD = D + D;
D2 = D * D;
SumD = sum(D)
SumDD = sum(DD)
SumD2 = sum(D2)
