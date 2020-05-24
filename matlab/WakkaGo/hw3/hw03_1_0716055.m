%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: 3.1
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/05/08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

disp('Assignment Problem 3.1')  

x = -10:0.01:10;
y1 = sin(5.*x) + 5;
y2 = 2.*cos(x.^2) - 5;

z1 = x.*sin(x./2) + 5;
z2 = 2.*cos(x.^2)./(sin(x)+1.5) - 1;


clf;
figure(1);
hold on;
subplot(1,2,1);
plot(x, y1, 'linewidth', 3);
plot(x, y2, 'linewidth', 3);
subplot(1,2,2);    
plot(x, z1, 'linewidth', 3);
plot(x, z2, 'linewidth', 3);
    
for k = 1:-0.01:0
    pause(1/30);
    axis([-10 10 -10 10])
    clf
    subplot(1,2,1);
    hold on
    plot(x, y1, 'linewidth', 3);
    plot(x, y2, 'linewidth', 3);
    y = k.*y1 + (1-k).*y2;
    plot(x, y, 'linewidth', 3);  
    set(gca,'FontSize',15);         %set font size
    
    subplot(1,2,2);
    hold on
    plot(x, z1, 'linewidth', 3);
    plot(x, z2, 'linewidth', 3);
    z = k.*z1 + (1-k).*z2;
    plot(x, z, 'linewidth', 3); 
    set(gca,'FontSize',15);         %set font size

    if (k==1)
        input('Press a key to continue...');
    end
end

