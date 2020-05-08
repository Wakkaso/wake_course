%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: ?
% Student Name:  ?
% Student ID: ?
% Email address: ?
% Department: Computer Science, NCTU
% Date: ?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

% show ???
disp('Example')  

%y1(x) = x, y2(x) = ( x2 +2 )/ (|x|+1)
%z1(x) = sin(x), z2(x) = cos(x)

x = -10:0.025:10;
y1 = x;
y2 = (x.^2+2)./(abs(x)+1);

z1 = sin(x)+1;
z2 = cos(x);

clf
figure
hold on
subplot(1,2,1);
plot(x, y1, 'linewidth', 3);
plot(x, y2, 'linewidth', 3);
subplot(1,2,2);    
plot(x, z1, 'linewidth', 3);
plot(x, z2, 'linewidth', 3);
    
for k = 1:-0.01:0
    pause(0.05);
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

