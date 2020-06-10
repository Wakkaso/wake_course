%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 2
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: CS
% Date: 5/21.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all; clear; clc;		% close all windows
                            		% clear variables, and clear screen

disp('Midterm Problem 2.2') 	% show Midterm Problem 2.1

disp('Student Name:TSAI YU CHENG ; Student ID: 0716074');

a1 = 10; b1 = 5; c1 = 0; n1 = 4; 

x = -10:0.025:10;
y1 = a1 * sin( n1*x + c1 ); 
y2 = b1 * sin( x );

a2 = 5;

z1 = a2 * ( 3 *cos(x) - cos(3*x) );
z2 = a2 * ( 3 *sin(x) - sin(3*x) );



input('Press a key to continue...');

for h = 0:0.01:1
    k = 2*h*sin(h*2*pi);
    clf;
    subplot(1,2,1);
    plot(y1, y2, 'linewidth', 3);
    hold on;
    plot(z1, z2, 'linewidth', 3);
    subplot(1,2,2);
    plot(y1, y2, 'linewidth', 3);
    hold on
    plot(z1, z2, 'linewidth', 3);
    
    set(gca,'FontSize',10);         %set font size
   
    subplot(1,2,1); 
    hold on

    y = k.*z1 + (1-k).*y1;
    z = k.*z2 + (1-k).*y2;
    plot(y, z, 'linewidth', 3); 
    axis([-40 40 -20 20 ])
    hold on;
    k1 = 2*h*sin(h*2*pi);
    k = (sin(k1*pi/2)).^2;
    subplot(1,2,2);
    y = k.*z1 + (1-k).*y1;
    z = k.*z2 + (1-k).*y2;
    plot(y, z, 'linewidth', 3); 
    hold on;
    set(gca,'FontSize',10);         %set font size
    axis([-40 40 -20 20 ])
    pause(1/30);

end
