%% Math Lab 6
%% Yu-Hao Chiang 3443130
close all
clear all
clc
a = sym('a',[1,5])
syms x
y = myhorner(a,x);
expand(y)
Sol = myhorner([144 -36 -34 4 2], x);
expand(Sol)

Sol_1 = myhorner([144 -36 -34 4 2], [0 1 2 3 4 5]) % check the value

figure
fplot(@(x) myhorner([144 -36 -34 4 2],x),[-5,5])
ylim([0 700])
% from the figure we can easily see that when x = [-4 -3 2 3]
% y would be zero

function y = myhorner(a,x)
% Horner's method to evaluate a polynomial
% a contains coefficient of the polynomial, stored in increasing order of the power of x.
% x may be a scalar, vector, or array of any size or shape.
n = length(a)-1;
% preallocate y to be the same shape and size as x, but
% initialized to contain copies of a(n+1). repmat serves
% this purpose this perfectly.
y = repmat(a(n+1),size(x));
for i = n:-1:1
    % Note use of .* to multiply by x. Recall that y is potentially a vector
    % or array, of the same shape and size as x. You wish to multiply every
    % element of y by the corresponding element of x.
    y = y.*x + a(i);
end
end