clear all
close all
clc

%% Ex 1 - code of Yen-Teh 
data = importdata("GK2007.txt");
n = data.data(1:2:end-1);
r = data.data(2:2:end);

figure
boxplot([data.data; n; r], [repmat({'Full data set'},size(data.data, 1),1); repmat({'Normalized'},size(n, 1),1); repmat({'Reversed'},size(r, 1),1)])

figure
histogram(data.data, 'BinWidth', 0.1)

for i = 1:5
    Q3 = quantile(data.data, 0.75);
    Q1 = quantile(data.data, 0.25);
    IQR = Q3 - Q1;
    Upper = Q3 + 1.5*IQR;
    Lower = Q1 - 1.5*IQR;
    data.data(data.data>Upper | data.data<Lower) = [];
end

for i = 1:5
    Q3 = quantile(n, 0.75);
    Q1 = quantile(n, 0.25);
    IQR = Q3 - Q1;
    Upper = Q3 + 1.5*IQR;
    Lower = Q1 - 1.5*IQR;
    n(n>Upper | n<Lower) = [];
end

for i = 1:5
    Q3 = quantile(r, 0.75);
    Q1 = quantile(r, 0.25);
    IQR = Q3 - Q1;
    Upper = Q3 + 1.5*IQR;
    Lower = Q1 - 1.5*IQR;
    r(r>Upper | r<Lower) = [];
end

figure
boxplot([data.data; n; r], [repmat({'Full data set'},size(data.data, 1),1); repmat({'Normalized'},size(n, 1),1); repmat({'Reversed'},size(r, 1),1)])

figure
histogram(data.data, 'BinWidth', 0.1)

%% Ex 2 - code of Yang 

% Initial value
k=10^(-6);
k_weight=0.04*10^(-6);

pw=1.027*10^3;
pw_weight=0.001*10^3;

pm=3.3*10^3;
pm_weight=0.01*10^3;

av=3*10^(-5);
av_weight=0.02*10^(-5);

zr=2500;
zr_weight=200;

tm=1300;
tm_weight=25;

t=29.7*10^(6)*365*24*3600;
t_weight=0.5*10^(6)*365*24*3600;

% Partial derivative
zr_p=1;
av_p=2*pm*tm/(pm-pw)*(k*t/pi)^(1/2);
pm_p=2*av*tm*(k*t/pi)^(1/2)*(-pw)*(pm-pw)^(-2);
tm_p=2*pm*av/(pm-pw)*(k*t/pi)^(1/2);
pw_p=2*pm*av*tm*(k*t/pi)^(1/2)*(pm-pw)^(-2);
k_p=pm*av*tm/(pm-pw)*(t/pi)^(1/2)*(k)^(-1/2);
t_p=pm*av*tm/(pm-pw)*(k/pi)^(1/2)*(t)^(-1/2);

% Calculate results
sigma=sqrt((zr_p*zr_weight)^2+(av_p*av_weight)^2+(pm_p*pm_weight)^2+(tm_p*tm_weight)^2+(pw_p*pw_weight)^2+(k_p*k_weight)^2+(t_p*t_weight)^2);
result = zr+2*pm*av*tm/(pm-pw)*(k*t/pi)^(1/2);

%% Ex 3 - code of Yu-Hao
load AIS_IceSheet_ice.mat
delta_ice = zeros(154,1);

for i = 1 : 154
   delta_ice(i) = nanmean(ice.CHANGE(:, :, i), 'all');
end
% y = Ax + e
A = [ice.time_dec(:), ones(154,1)];
y = delta_ice;
x_hat = (A'*A)^(-1) * A' * y;
y_hat = A * x_hat;
e_hat = y - y_hat;
m = size(A,1);
n = size(A,2);
sigma0 = sqrt(e_hat' * e_hat / (m-n)); % standard deviation

[e_hat1, TF] = rmoutliers(e_hat); % remove the outliers
sigma0_rmout = sqrt(e_hat1' * e_hat1 / (m-n)); % standard deviation after removing the outliers
ice.time_dec(19) = []; % remove the outliers
A1 = [ice.time_dec(:), ones(153,1)];
y(19) = []; % remove the outliers
y1 = y;
y_hat(19)=[]; % remove the outliers
x1 = (A1'*A1)^(-1) * A1' * y1;

figure
scatter(ice.time_dec, y1,'.')
hold on
box on
p1 = plot(ice.time_dec, x_hat(1)*ice.time_dec+x_hat(2), 'r');     
p2 = plot(ice.time_dec, x1(1)*ice.time_dec + x1(2), 'g'); 
legend([p1, p2],'OLS', 'remove the outliers')
xlabel('Time')
ylabel('Ice changed')
title('Ice changed from 2002 to 2018')
