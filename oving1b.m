clear; close all;clc

% Konstant
linewidth = 2;

% Leser inn målinger. 
measurements = readtable('Inclination-2025-01-07 14-12-11.xls');
t = measurements{:,1};
x = measurements{:,2};

% Justerer datasettet
t = [0; t];
x = [x(1); x];

% Definisjon av nye lister til plotting
middelverdi = [mean(x); mean(x)];
fullTid = [t(1); t(end)];
xStd = [std(x); std(x)];

% Sjekker begge sider av middelverdien, under xStd størrelsene
standardAvvikIndekser = find(abs(x - middelverdi(1)) < xStd(1));

% Plotter inn datasettene
figure
plot(t,x,'b-x')
hold on
plot(t(standardAvvikIndekser), x(standardAvvikIndekser), 'ro')
hold on
plot(fullTid, middelverdi + xStd, 'k:', 'LineWidth', linewidth)
hold on
plot(fullTid, middelverdi, 'k--')
hold on
plot(fullTid, middelverdi - xStd, 'k:', 'LineWidth', linewidth)
grid on
xlabel('tid [s]')
ylabel('Vinkel [$^{\circ}$]')
legend(['M{\aa}linger $\{x_k\}$ med $\bar{x}=$', num2str(middelverdi(1)), ', $\sigma=$' num2str(xStd(1))], 'M{\aa}linger innenfor standardavvik', 'Standardavvik grenser', 'Middelverdi')
title(['Andel m{\aa}linger innenfor standardavviket: ', num2str(100*length(standardAvvikIndekser)/length(x)), '$\%$'])