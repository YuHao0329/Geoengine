%% Fire forest 

close all
clear all
clc
max_step = 1000;
p = 0.3;
% Set size of forest
N = 80;
C = ones(N, N);
no_fire = zeros(N, N);
fire_stat = no_fire;


% Set the initial fire
fire_init = [ceil(N/2) ceil(N/2)];
fire_stat(fire_init(1), fire_init(2)) = 1;


% Simulate the fire spread
figure(1)
k = 0;
surf(1:N, 1:N, fire_stat)
title(sprintf('t = %d', k))
view(2)
drawnow

k = k + 1;
[row, col] = find(fire_stat == 1);
fire_list = [row, col];
% pause(0.05)

while k < max_step && size(fire_list, 1) > 0
    
    for i = 1:size(fire_list, 1)
        if fire_list(i, 1) ~= 1
            if fire_stat( fire_list(i, 1) - 1, fire_list(i, 2) ) == 0 && rand(1) < p;
                fire_stat( fire_list(i, 1) - 1, fire_list(i, 2) ) = 1;
            end
        end
        
        if fire_list(i, 1) ~= N
            if fire_stat( fire_list(i, 1) + 1, fire_list(i, 2) ) == 0 && rand(1) < p;
                fire_stat( fire_list(i, 1) + 1, fire_list(i, 2) ) = 1;
            end
        end
        
        if fire_list(i, 2) ~= 1
            if fire_stat( fire_list(i, 1), fire_list(i, 2) - 1 ) == 0 && rand(1) < p;
                fire_stat( fire_list(i, 1), fire_list(i, 2) - 1 ) = 1;
            end
        end
        
        if fire_list(i, 2) ~= N
            if fire_stat( fire_list(i, 1), fire_list(i, 2) + 1 ) == 0 && rand(1) < p;
                fire_stat( fire_list(i, 1), fire_list(i, 2) + 1 ) = 1;
            end
        end
        fire_stat( fire_list(i, 1), fire_list(i, 2) ) = 2;
    end
    
    surf(1:N, 1:N, fire_stat)
    title(sprintf('t = %d', k))
    axis([1, N, 1, N, 0, 2])
    % colormap [row] = 0, 1, 2    [Column] = R, G, B
    colormap([0, 1, 0;
              1, 0, 0;
              0, 0, 0;])
    caxis([0, 2])
    view(2)
    drawnow
    k = k + 1;
    [row, col] = find(fire_stat == 1);
    fire_list = [row, col];
%     pause(0.05)
end
