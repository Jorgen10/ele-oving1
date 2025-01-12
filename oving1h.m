%--------------------------------------------------------- 
% h) Nyttige kommandoer:
%
% while, input, if, isempty, tic, toc
%--------------------------------------------------------- 

clear; close all; clc

% initialisering
Tid(1) = 0;
Key(1) = 0;
Ts(1) = 0;

startKlokke = input('Etter du trykker enter starter klokken. Du har 10 sekunder til å skrive in verdier');
klokke = tic;

while toc(klokke) < 10
    indeks = length(Key);
    curKey = input('Skriv inn et tall: ');
    if isempty(curKey)
        Key(indeks+1) = 0;
    else
        Key(indeks+1) = curKey;
    end
    Tid(indeks+1) = toc(klokke);
    Ts(indeks+1) = Tid(indeks+1) - Tid(indeks);
end

figure()
subplot(2,1,1)
plot(Tid, Key)
grid on
xlabel('tid [s]')
ylabel('verdi')
legend('Tallverdier trykket inn')

subplot(2,1,2)
plot(Tid, Ts)
grid on
xlabel('tid [s]')
ylabel('[sekund]')
legend('Tidsavstand mellom tidspunkt')