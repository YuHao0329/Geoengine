clear all
close all
clc
%% Task 1
% depth = importdata("depths.txt");
% 
% mean_depth = mean(depth);
% sigma_depth = std(depth);
% 
% c_level = 0.95;
% c_interval = norminv([(1-c_level)/2, 1-((1-c_level)/2)], mean_depth, sigma_depth);
% 
% pd = makedist('Normal', 'mu', mean_depth, 'sigma', sigma_depth);
% x = mean_depth - 3.5*sigma_depth: mean_depth + 3.5*sigma_depth;
% pdf_normal = pdf(pd,x);
% 
% figure
% plot(depth, '.')
% hold on
% yline(mean_depth, 'r')
% yline(c_interval(1))
% yline(c_interval(2))
% 
% figure
% plot(x, pdf_normal, 'LineWidth', 2)
% hold on
% xline(mean_depth, 'r')
% xline(c_interval(1))
% xline(c_interval(2))

%% Task 3
% water_soil = importdata("soilwater.txt");
% 
% mean_soil_1 = mean(water_soil(:, 1), 'omitnan');
% mean_soil_2 = mean(water_soil(:, 2));
% sigma_soil_1 = std(water_soil(:, 1), 'omitnan');
% sigma_soil_2 = std(water_soil(:, 2));
% n1 = sum(~isnan(water_soil(:, 1)));
% n2 = sum(~isnan(water_soil(: ,2)));
% 
% alpha = 0.01;
% v = n1 + n2 - 2;
% t = (mean_soil_1 - mean_soil_2) / sqrt(((n1-1)*sigma_soil_1^2 + (n2-1)*sigma_soil_2^2) / v * (1/n1 + 1/n2));
% t_crit = tinv(1 - alpha/2, v);
% if t <= t_crit
%     disp('Accept H0')
% else
%     disp('Reject H0')
% end

%% Task 5
sulfur = importdata('sulfur.txt');

edges = [0, 10, 15, 20, 25, Inf];
histogram(sulfur, 'BinEdges', edges)

mean_sulfur = mean(sulfur);
sigma_sulfur = std(sulfur);

z_sulfur = (sulfur - mean_sulfur) / sigma_sulfur;
p = 0.1;
z_edges = norminv(0:p:1);

figure
histogram(z_sulfur, 'BinEdges', z_edges)

E = length(z_sulfur) / (length(z_edges) - 1);
O = histcounts(z_sulfur, z_edges);
chi2 = sum((O - E).^2 / E);

v = 1 / p - 3;
alpha = 0.05;
chi2_crit = chi2inv(1 - alpha, v);% right tail test
if chi2 <= chi2_crit
    disp('Accept H0')
else
    disp('Rehect H0')
end