%% Advanced Mathetmatics Lab 10
%% Yu-Hao Chiang 3443130
close all 
clear all 
clc
%% Ex 1
GK2007 = importdata('GK2007.txt');
n = GK2007.textdata(1:2:end-1);
r = GK2007.textdata(2:2:end);
n_data = GK2007.data(1:2:end-1);
r_data = GK2007.data(2:2:end);

data = [GK2007.data; r_data; n_data];
g1 = repmat({'entire'}, 288, 1);
g2 = repmat({'reverse'}, 144, 1);
g3 = repmat({'normal'}, 144, 1);
g = [g1; g2; g3];
boxplot(data, g)
title('The Earths magnetic field reversed direction over geologic time', 'fontsize', 12)

% remove the outlier
std = std(GK2007.data);
n = 1;
for i = 1:length(GK2007.data)
    if GK2007.data(i) < median(GK2007.data)+2.698*std && GK2007.data(i) > median(GK2007.data)-2.698*std
        data_corrected(n) = GK2007.data(i);
        n = n + 1;
    end
end
data_corrected = data_corrected';

n = 1;
for i = 1:length(r_data)
    if r_data(i) < median(r_data)+2.698*std && r_data(i) > median(r_data)-2.698*std
        r_corrected(n) = r_data(i);
        n = n + 1;
    end
end
r_corrected = r_corrected';

n = 1;
for i = 1:length(n_data)
    if n_data(i) < median(n_data)+2.698*std && n_data(i) > median(n_data)-2.698*std
        n_corrected(n) = n_data(i);
        n = n + 1;
    end
end
n_corrected = n_corrected';

% data_corrected(data_corrected< 0.01 | data_corrected > 0.975) = [];
% r_corrected(r_corrected< 0.02 | r_corrected > 0.859) = [];
% n_corrected(n_corrected < 0.01 | n_corrected > 1.029) = [];

data = [data_corrected; r_corrected; n_corrected];
g1 = repmat({'entire'}, length(data_corrected), 1);
g2 = repmat({'reverse'}, length(r_corrected), 1);
g3 = repmat({'normal'}, length(n_corrected), 1);
g = [g1; g2; g3];
boxplot(data, g)
title('The Earths magnetic field reversed direction over geologic time', 'fontsize', 12)
ylabel('Myr.');

figure
data = histogram(data_corrected);
data.BinWidth = 0.1;
xlabel('Myr.');
ylabel('Number');
title('The histogram of Earths magnetic field')
%% Ex 3
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



