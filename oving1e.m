%--------------------------------------------------- 
% e) Nyttige kommandoer                    
%
%  histogram, ceil, floor, axis, xlim
%  text, sprintf, ylabel
% --------------------------------------------------- 

clear; close all; clc

% Leser inn målinger.
measurements = readtable('Inclination-2025-01-07 14-12-11.xls');
t = measurements{:,1};
x = measurements{:,2};

% Justerer datasett
t = [0; t];
x = [x(1); x];

nbins = 20;
% String representasjon av edges
strEdges = '[-30:5:100]';
% Konverterer strEdges til et num-array
% Det betyr at en variabel oppdaterer alt
% Prøvde num2str(edges), men fikk da alle edges ut, noe som ikke så bra ut
% Dette løser problemet
edges = str2num(strEdges);

figure
subplot(2,1,1)
plot(t,x,'b-x')
grid on
xlabel('tid [s]')
ylabel('Vinkel [$^{\circ}$]')
title('M{\aa}lesignal $\{x_k$\}, tilt-vinkel opp og ned')
legend('M{\aa}linger $\{x_k$\}')

% Plott histogrammet til "x" i subplot(2,1,2) med
% 
%   x_prop = histogram(x)  -> uten semikolon
% 
% Da vil i tillegg mye informasjon om histogrammet 
% presenteres i Command Window. 
% 
% I koden kan du velge å benytte 
%    - x_prop.BinEdges 
%    - x_prop.BinWidth 
%    - x_prop.BinLimits 
% til å hente ut data fra histogrammet til "x" som
% du kan bruke i programmeringen. 

subplot(2,1,2)
x_prop = histogram(x);  % ---> sjekk Command Window

ylabel(['\# m{\aa}linger i intervallene']);
xlabel('Intervall i $\{x_k\}$')
title('Automatisk inndeling i intervall ved bruk av {\tt histogram(x)}')
xlim(x_prop.BinLimits);



%--------------------------------------
% Figur 2.
%--------------------------------------
figure(2)

% Plotter histogrammet til x hvor vi styrer
% antall intervall (nbins)
subplot(2,1,1)
x_prop = histogram(x);
x_prop.NumBins = nbins;
xlim(x_prop.BinLimits)
ylabel(['\# m{\aa}linger i intervallene']);
xlabel('Intervall i $\{x_k\}$')
title(['Selvvalgt oppdeling i {\tt nbins=}' num2str(nbins) ' intervall'])



% Plotter histogrammet til x hvor vi styrer
%   - intervallgrensene (max,min) 
%   - intervallbredden (step) 
% edges = min:step:max
subplot(2,1,2)
x_prop = histogram(x);
hold on
x_prop.BinEdges = edges;
xline(mean(x), 'r', 'LineWidth', 2)
plot([mean(x),std(x)+mean(x)],[8, 8], 'g', 'LineWidth', 2)
xlim(x_prop.BinLimits)
ylabel(['\# m{\aa}linger i intervallene']);
xlabel('Intervall i $\{x_k\}$')
legend('Fordeing av m{\aa}lingene $\{x_k\}$', ['Middelverdi $\{\bar{x}\}=$' num2str(mean(x))], ['Standardavvik ' '$\{\sigma\}$=' num2str(std(x))])
title(['Selvvalgt oppdeling av intervall som {\tt edges=}' strEdges])
