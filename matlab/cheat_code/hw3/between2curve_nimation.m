%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: 1
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 5/8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;		% clear the current figure
 				% clear variables, and clear screen

disp('Assignment Problem 3.1') 	% show Assignment Problem 3.1
x = -10:0.025:10;
y1 = sin(5.*x)+5;
y2 = 2.*cos(x.^2)-5;

z1 = x.*sin(x./2)+5;
z2 = 2.*cos(x.^2)./(sin(x)+1.5)-1;

clf
figure
hold on
subplot(1,2,1);
plot(x, y1, 'linewidth', 1);
plot(x, y2, 'linewidth', 1);
subplot(1,2,2);   
plot(x, z1, 'linewidth', 1);
plot(x, z2, 'linewidth', 1);
    
for k = 1:-0.01:0
    pause(1/30);
    clf
    subplot(1,2,1);
    hold on
    plot(x, y1, 'linewidth',1);
    plot(x, y2, 'linewidth',1);
    y = k.*y1 + (1-k).*y2;
    plot(x, y, 'linewidth', 1);  
    set(gca,'FontSize',10);         %set font size
    
    subplot(1,2,2);
    hold on
    plot(x, z1, 'linewidth', 1);
    plot(x, z2, 'linewidth', 1);
    z = k.*z1 + (1-k).*z2;
    plot(x, z, 'linewidth', 1); 
    set(gca,'FontSize',10);         %set font size

    if (k==1)
        input('Press a key to continue...');
    end
end

