function [Sol] = fire_simulator(N, p, max_step)

% fire_simulator returns the solution of the fire forest
% 
% How [Sol] = fire_simulator(N, p, max_step)
% IN
%   N         -   the size of the matrix
%   p         -   the probability of propagation
%   max_step  -   number of iterations to plot
%OUT
%   Sol       -   plot the simulation of fire forest
%
% -----------------------------------------------------------------
% Yu-Hao Chiang, University of Stuttgart                 11/13/2020
% -----------------------------------------------------------------
%
% Here we go

% Set size of forest
no_fire = zeros(N, N);
fire_stat = no_fire;


% Set the initial fire
fire_init = [ceil(N/2) ceil(N/2)];
fire_stat(fire_init(1), fire_init(2)) = 1;


% Simulate the fire spread (Plot the result)
figure(1)
k = 0; % step
surf(1:N, 1:N, fire_stat)
title(sprintf('t = %d', k))
view(2)
drawnow

k = k + 1;
[row, col] = find(fire_stat == 1);
fire_list = [row, col];
pause(0.05)

while k < max_step && size(fire_list, 1) > 0
    % define 0 == not burn, 1 == burning, 2 == burned out
    for i = 1:size(fire_list, 1)
        if fire_list(i, 1) ~= 1 % second row to the N row
            if fire_stat( fire_list(i, 1) - 1, fire_list(i, 2) ) == 0 && rand(1) < p;
                % There is no fire and randomly select burning probability 
                fire_stat( fire_list(i, 1) - 1, fire_list(i, 2) ) = 1;
                % if the probability less than p then the row-1 would burn
            end
        end
        
        if fire_list(i, 1) ~= N % first row to N-1 row
            if fire_stat( fire_list(i, 1) + 1, fire_list(i, 2) ) == 0 && rand(1) < p;
                % There is no fire and randomly select burning probability
                fire_stat( fire_list(i, 1) + 1, fire_list(i, 2) ) = 1;
                % if the probability less than p then the row+1 would burn
            end
        end
        
        if fire_list(i, 2) ~= 1 % second column to the N column
            if fire_stat( fire_list(i, 1), fire_list(i, 2) - 1 ) == 0 && rand(1) < p;
                % There is no fire and randomly select burning probability
                fire_stat( fire_list(i, 1), fire_list(i, 2) - 1 ) = 1;
                % if the probability less than p then the column-1 would burn
            end
        end
        
        if fire_list(i, 2) ~= N % first column to N-1 column
            if fire_stat( fire_list(i, 1), fire_list(i, 2) + 1 ) == 0 && rand(1) < p;
                % There is no fire and randomly select burning probability
                fire_stat( fire_list(i, 1), fire_list(i, 2) + 1 ) = 1;
                % if the probability less than p then the column+1 would burn
            end
        end
        fire_stat( fire_list(i, 1), fire_list(i, 2) ) = 2;
        % the points burned out 
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
    pause(0.05)
end


