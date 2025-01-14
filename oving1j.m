%--------------------------------------------------- 
% j) Nyttige kommandoer  
%  
%  find, NaN
%--------------------------------------------------- 

clear; close all; clc

% laster inn .mat-fil bestående av tidsvektor "Tid" og 
% måling "Lys" som er fra lyssensoren 
load('Lego_measurements_oppg_1j.mat')         

% gir variablene nytt navn i henhold til kompendiet
u = Lys;
t = Tid;

% Figur 1 med 3x1 subplot
figure

% -----------------------------------------
% Plotting av data kun mot indeks
%subplot(3,1,1)
%plot(u,'b')  % kun ett argument i plot-kallet = plotting mot indeks
%grid
%title('M{\aa}lesignal $\{u_k\}$ som funksjon av indeks $k$')
%xlabel('indeks $k$')
%ylim([0 80])

% Henter første indeks hvor grafen stiger over 50
% Sjekket manuelt at det er rundt der kurven begynner
index = find(u > 50, 1, 'first');

% Fjerner data før den første indeksen
u = u(index:end);
t = t(index:end);

% Fjerner offset fra tidsvektoren
t = t - t(1);

%subplot(3,1,2)
%plot(t,u,'b')
%grid
%title('M{\aa}lesignal $\{u_k\}$ som funksjon av tid $t$')
%xlabel('tid $t$')

% Finner indeksene til utstikkerene
index = [find(u < 30) find(u > 58)];
% Sletter dem fra vektorene
u(index) = [];
t(index) = [];

% Fjerner C.
% Prøvde med å bytte ut elementene med NaN,
% men fikk NaN tilbake fra mean
u = u - mean(u);

%subplot(3,1,3)
plot(t,u,'b')
hold on
%plot(t, 10*sin(t*0.9))
grid
title('M{\aa}lesignal $\{u_k\}$ som funksjon av tid $t$')
xlabel('tid $t$')