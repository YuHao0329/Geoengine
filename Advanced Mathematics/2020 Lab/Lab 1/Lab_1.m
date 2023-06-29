%% AdvMaths & MapProjs Lab1
%% Yu-Hao Chiang 3443130
close all
clear all
clc
% Exercise on Matlab - Work on matrix
M = [10 7 8 7;
      7 5 6 5; 
     8 6 10 9; 
     7 5 9 10];

Det_M = det(M)
A = M * M
B = M .* M
% The difference between A and B is:
% M .* M represents the multiplication of the corresponding elements of the two matrices. 
% M * M, it is a normal matrix multiplication, not the corresponding element multiplication. 
% -----------------------------------------------------------------------------------------
v1 = [32; 23; 33; 31]
v2 = [32.1; 22.9; 33.1; 30.9]
ans_1 = inv(M) * v1
ans_2 = inv(M) * v2
% -----------------------------------------------------------------------------------------
% Exercise on Matlab - Forest fire
% we assume N = 80, p = 0.7, max step = 1000
fire_simulator(80, 0.7, 1000)