clear; close all; clc

% Leser inn målinger.
measurements = readtable('Inclination-2025-01-07 14-12-11.xls');
t = measurements{:,1};
x = measurements{:,2};

% Justerer datasett
t = [0; t];
x = [x(1); x];

% Sorterer målingene
x = sort(x,'descend');

% Justerer ned størrelsen på målingene slik at avrundinger 
% til nærmeste heltall blir godt synlige
x = x/39.6;

% Seperate avrundinger. Ser i etterkant at jeg kunne brukt fix
ceilFloor = [floor(x(x >= 0)); ceil(x(x < 0))];

% Plotter alt inn
figure
subplot(2,2,1)
plot(t,x,'b-x')
hold on
plot(t, round(x), 'r-x')
legend('$\{x_k\}$', 'avrundet')
title('Avrund til',  'n{\ae}rmeste heltall')

subplot(2,2,2)
plot(t,x,'b-x')
hold on
plot(t, ceilFloor, 'r-x')
legend('$\{x_k\}$', 'avrundet')
title('Avrund positive verdier nedover', 'og negative verdier oppover')

subplot(2,2,3)
plot(t,x,'b-x')
hold on
plot(t, floor(x), 'r-x')
legend('$\{x_k\}$', 'avrundet')
title('Avrund alt nedover')

subplot(2,2,4)
plot(t,x,'b-x')
hold on
plot(t, ceil(x), 'r-x')
legend('$\{x_k\}$', 'avrundet')
title('Avrund alt oppover')

% Tittel over subplottene
sgtitle('Forskjellig avrundinger av sorterte og nedjusterte m{\aa}linger')