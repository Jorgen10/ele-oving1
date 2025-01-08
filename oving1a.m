% -----------------------------------------------------
% a) Nyttige kommandoer
%
% size, length, xlim, hold, subplot, 
% plot, grid, max, min, diff, title, xlabel, 
%--------------------------------------------------

clear; close all; clc

% Leser inn målinger. 
% Oppdater filnavnet til Excel-filen
measurements = readtable('Inclination-2025-01-07 14-12-11.xls');
t = measurements{:,1};
x = measurements{:,2};

% Justerer datasettet, og lager en kopi av t (brukes senere)
%   - Legg til ett element i både t og x.
tdiff = t;
t = [0; t];
x = [0; x];

% Finner differansen i x listen
xdiff = diff(x);

% Henter ut max, min verdier i tillegg til indekser
[max_x, max_index] = max(x);
[min_x, min_index] = min(x);
[max_diff, max_diff_index] = max(xdiff);
[min_diff, min_diff_index] = min(xdiff);

% Plot resultat
figure
subplot(2,1,1)
plot(t,x,'b-x')
hold on
plot([t(min_diff_index:min_diff_index+1)],x(min_diff_index:min_diff_index+1))
hold on
plot([t(max_diff_index:max_diff_index+1)],x(max_diff_index:max_diff_index+1))
hold on
plot(t(min_index), min_x, "R*")
hold on
plot(t(max_index), max_x, "G*")
grid on
xlabel('tid [s]')
ylabel('Vinkel [$^{\circ}$]')
title('M{\aa}lesignal $\{x_k$\}, tilt opp og ned')
legend('M{\aa}linger $\{x_k$\}', "Vinkel sank mest", "Vinkel steg mest", "min", "max")
subplot(2,1,2)
plot(tdiff,xdiff,"b-x")
hold on
plot(tdiff(min_diff_index), min_diff, "*")
hold on
plot(tdiff(max_diff_index), max_diff, "*")
xlabel('tid [s]')
ylabel('Endring i vinkel [$^{\circ}$]')
title("Endring i m{\aa}linger over tid")
legend("Endring i m{\aa}linger", "Min differanse", "Maks differanse")