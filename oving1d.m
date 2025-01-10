%--------------------------------------------------
% d) Nyttige kommandoer
% 
%  sqrt, .^ (elementvise operasjoner), for-løkke 
%--------------------------------------------------
clear; close all;clc

% Leser inn målinger.
measurements = readtable('Inclination-2025-01-07 14-12-11.xls');
t = measurements{:,1};
x = measurements{:,2};

% Justerer datasett
t = [0; t];
x = [x(1); x];

figure
plot(t,x,'b-x')
grid on
xlabel('tid [s]')
ylabel('Vinkel [$^{\circ}$]')


M = length(x);  % antall elementer

% Initialisering av variabler (for å unngå indeks 0)
sum_x = x(1);
mean_x = x(1);
std_x = 0;

% Beregn middelverdi og deretter standardavvik rekursivt
for k = 2:M
   % Beregner sum og mean rekursivt
   sum_x(k) = sum_x(k-1) + x(k);
   mean_x(k) = (1/k)*sum_x(k);

   % Initialisering av sum (for å unngå indeks 0)
   sum_std_x = 0;

   % Beregn sum til bruk i standardavvik rekursivt
   for n = 1:k
      sum_std_x = sum_std_x + (x(n) - mean_x(k))^2;
   end

   % Beregn standardavvik rekursivt
   std_x(k) = sqrt(1/(k-1)*sum_std_x);

end

% Sammenligning av verdier
disp(['mean_x(end) = ',num2str(mean_x(end),4)])
disp(['mean(x) = ',num2str(mean(x), 4)])
disp(['std_x(end) = ',num2str(std_x(end))])
disp(['std(x) = ',num2str(std(x))])

% Plotting av data
plot(t,x,'b-x')
hold on
plot(t,mean_x,'r-x')
plot(t,std_x,'g-x')
grid on
title('M{\aa}linger og utvikling av middelverdi og standardavvik')
xlabel('tid [s]')
legend('M{\aa}linger $\{x_k\}$',...
    'Middelverdi $\{\bar{x}_k\}$',...
    'Standardavvik $\{\sigma_k\}$')