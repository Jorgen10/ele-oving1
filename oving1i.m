%--------------------------------------------------- 
% i) Nyttige kommandoer  
%  
% area, sin
%--------------------------------------------------- 

clear; close all; clc

U = 4;
w = 7;
C = 0;

disp(-(U/w)*cos(w*1) + C*1 + (U/w))

%------------------------------------
% Figur 1 med 3x1 subplot
%------------------------------------
figure(1)
set(gcf,'position',[1000 500 450 600])

% Juster på denne
ant_runder = 3;

for i = 1:ant_runder
    t = 0:0.01:5;
    u = U*sin(w*t)+C;
    y = -(U/w)*cos(w*t) + C*t + (U/w);
    

    subplot(3,1,1)
    plot(t,u,'Linewidth',2)
    hold on
    grid
    title('$u(t) = U\cdot \sin(\omega\cdot t) + C$')

    subplot(3,1,2)
    area(t,u)
    grid
    hold on
    title('Fargelagt areal under $u(t)$')

    subplot(3,1,3)
    plot(t,y,'LineWidth',2)
    grid
    hold on
    title(['$y(t) = -\frac{U}{\omega}\cdot \cos(\omega\cdot t) +C\cdot t + \frac{U}{\omega}$'])
    
    % justering av C og/eller vinkelfrekvens w
    %C = C - 0.4;
    w = w - 2;
end


