clear
% input dataset
data1 = importdata('GK2007.txt');
data2 = data1.data;
data3 = char(data1.textdata);

% remove the data that more that one standard deviation
std = std(data2);
n = 1;
for i = 1:length(data2)
    if data2(i) < median(data2)+std && data2(i) > median(data2)-std
        data_correct(n) = data2(i);
        n = n+1;
    end
end

% detect the last letter in the chron
% ("n" means normalized, and "r" means reversed)
for i = 1:288
    for j = 1:10
        if data3(i,j) ~= ' ' && data3(i,j) ~= '*'
            data4(i) = data3(i,j);
        end
    end
end


n = 1;
r = 1;
for i = 1:length(data_correct)
    if data4(i) == 'n'
        data_n(n) = data_correct(i);
        n = n + 1;
    end
    if data4(i) == 'r'
        data_r(r) = data_correct(i);
        r = r+1;
    end
end

figure(1)               % plot for entire data
boxplot(data_correct)
title('Entire Data')
figure(2)               % plot for normal polarities
boxplot(data_n)
title('Normal polarities')
figure(3)               % plot for reverse polarities
boxplot(data_r)
title('Reverse polarities')
figure(4)               % make a histogram of all intervals
D = histogram(data_correct);
D.BinWidth = 0.1;
title('Histogram of All Intervals')
xlabel('Myr.');
ylabel('Number');