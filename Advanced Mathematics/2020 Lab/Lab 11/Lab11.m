%% Advanced Mathematics Lab 11
%% Yu-Hao Chiang 3443130
close all
clear all
clc
%% Task 1
depth = importdata("depths.txt");

mean_depth = mean(depth);
sigma_depth = std(depth);

% 95% confidence interval on the mean depth
alpha = 0.05;
c_interval = norminv([alpha/2, 1-alpha/2], mean_depth, sigma_depth);

pd = makedist('Normal', 'mu', mean_depth, 'sigma', sigma_depth);
x = mean_depth - 4*sigma_depth: mean_depth + 4*sigma_depth;
pdf_normal = pdf(pd,x);

figure
plot(x, pdf_normal, 'LineWidth', 2)
hold on
xline(mean_depth, 'r')
xline(c_interval(1))
xline(c_interval(2))
xlabel('depths')
title('Normal distribution of depths')

% Look at Table A.1
% p(0.43) = 1 - p(-0.43) = 1 - 0.3336 =  0.6664
%% Task 2
clear
% approxiamte binomial distribution
n = 30; 
p = 0.8;
mean_people = n*p;
sigma_people = sqrt(n*p*(1-p));
alpha = 0.05;
c_interval = norminv([alpha/2, 1-alpha/2], mean_people, sigma_people);

pd = makedist('Normal', 'mu', mean_people, 'sigma', sigma_people);
x = mean_people - 3.5*sigma_people: mean_people + 3.5*sigma_people;
pdf_normal = pdf(pd,x);

figure
plot(x, pdf_normal, 'LineWidth', 2)
hold on
xline(mean_people, 'r')
xline(c_interval(1))
xline(c_interval(2))
xlabel('customers')
title('Normal distribution of customers')
%% Task 3
clear
% t-statistic
soilwater = importdata('soilwater.txt');
A = soilwater(:,1);
A = A(~isnan(A)); % skip away NaN
B = soilwater(:,2);
mean_A = mean(A);
mean_B = mean(B);
s_A = std(A);
s_B = std(B);
n_A = size(A,1);
n_B = size(B,1);
v = n_A + n_B - 2; % degree of freedom
alpha = 0.01;
% Look at the critical values for the student's distribution, using 99%
% confidence level, we can obtain the critical t value is 2.609
t_crit = tinv(1-alpha/2, v);
t = (mean_A - mean_B)/sqrt(((n_A-1)*s_A^2 + (n_B-1)*s_B^2)/v * (1/n_A + 1/n_B));
if t >= t_crit
    disp('Reject H0')
else
    disp('Accept H0')
end
% since t < t_crit we must accept H0. we can conclude that the soils at the two 
% sites have same water content.
%% Ex 4
clear
n = 50; % 50 beaches close to the chemical rejection zones are observed.
a = 10; % 10 beaches affected by the harmful algae.
alpha = 0.05;

%% Ex 5 
clear
sulfur = importdata('sulfur.txt');
edge = [0, 10, 15, 20, 25, inf];
figure
histogram(sulfur, edge)
title('The sulfur dioxide emissions in tons per day')

Mean = mean(sulfur);
s = std(sulfur);

z_sulfur = (sulfur - Mean) / s;
p = 0.2;
z_edges = norminv(0:p:1);


figure
histogram(z_sulfur, z_edges)

n = 80;
E = n*p;
O = histcounts(z_sulfur, z_edges);
chi2 = sum((O - E).^2 / E);

v = 1 / p -1-2;
alpha = 0.05;
chi2_crit = chi2inv(1-alpha, v);

if chi2 >= chi2_crit
    disp('Reject H0')
else
    disp('Accept H0')
end




