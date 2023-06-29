%% AdvMaths Lab 2
%% Yu-Hao Chiang 3443130
%% Exercise 4 -  Matlab
clc
close all
clear all　
%% AIS_IceSheet_ice

load('AIS_IceSheet_ice.mat')

[X, Y] = meshgrid(ice.x, ice.y);

figure(1)
h = pcolor(X', Y', shiftdim(ice.CHANGE(:, :, 120)))
set(h, 'Linestyle', 'none')
c = colorbar;
c.Label.String = 'Ice Mass Change (kg/m^2)'
title('AIS Ice Sheet Grid')

% compute the gradient of ice 
[gx, gy] = gradient(shiftdim(ice.CHANGE(:, :, 120)));
% compute curl(gradient)
curl_grad_ice = curl(gx,gy);

figure(2)
quiver(X', Y', gx, gy)
hold on 
contour(X', Y', shiftdim(ice.CHANGE(:, :, 120)), 'Showtext', 'on')
hold off
title('The Contour of AIS Ice Sheet Grid')

figure(3)
quiver(X', Y', gx, gy)
hold on 
contour(X', Y', curl_grad_ice, 'Showtext', 'on')
hold off
title('The curl(grad) of AIS Ice Sheet Grid')
%% AIUB_CHAMP01S_geoid
load('AIUB_CHAMP01S_geoid.mat')
% compute the gradient of geoid 
[dx, dy] = gradient(geoid.HEIGHT);
% compute curl(gradient)
curl_grad_geoid = curl(dx,dy);

figure(4)
h = pcolor(geoid.LON, geoid.LAT, geoid.HEIGHT)
set(h, 'Linestyle', 'none')
a = colorbar
a.Label.String = 'The Height of geoid (m)'
title('AIUB CHAMP01S geoid')

figure(5)
quiver(geoid.LON, geoid.LAT, dx, dy)
hold on 
contour(geoid.LON, geoid.LAT, geoid.HEIGHT, 'Showtext', 'on')
hold off
title('The Contour of AIUB CHAMP01S geoid')

figure(6)
quiver(geoid.LON, geoid.LAT, dx, dy)
hold on 
contour(geoid.LON, geoid.LAT, curl_grad_geoid, 'Showtext', 'on')
hold off
title('The curl(grad) of AIUB CHAMP01S geoid')

%% weathermodel_winds
load('weathermodel_winds.mat')
% compute the divergence of winds
div_winds = divergence(winds.X, winds.Y, winds.U, winds.V);
% compute the curl of winds
curl_winds = curl(winds.X, winds.Y, winds.U, winds.V);
% compute the divergence(curl) of winds
div_curl = divergence(curl_winds, winds.U, winds.V, winds.W);

figure(7)
box on
quiver3(winds.X, winds.Y, div_winds, winds.U, winds.V, winds.W)
view(2)
xlim([-100000 100000])
ylim([-100000 100000])
title('The Divergence of quiver Wind Prediction')

figure(8)
box on
quiver3(winds.X, winds.Y, curl_winds, winds.U, winds.V, winds.W)
view(2)
xlim([-100000 100000])
ylim([-100000 100000])
title('The Curl of quiver Wind Prediction')

figure(9)
h = pcolor(winds.X, winds.Y, div_winds);
hold on
set(h, 'Linestyle', 'none')
shading interp
colorbar
axis tight
title('The Divergence of Weather Model Wind Prediction')


figure(10)
h = pcolor(winds.X, winds.Y, curl_winds);
hold on
plot(winds.LON, winds.LAT)
set(h, 'Linestyle', 'none')
shading interp
colorbar
axis tight
title('The Curl of Weather Model Wind Prediction')


figure(11)
contour(winds.X, winds.Y, div_curl, 'Showtext', 'on')
hold on
quiver(winds.X, winds.Y, winds.U, winds.V)
title('div(curl) = 0')

