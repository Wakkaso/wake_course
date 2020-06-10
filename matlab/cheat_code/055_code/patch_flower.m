%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab
% Problem number: 3.2
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/05/08
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;

disp('Assignment Problem 3.2')  

hold on;
for x = 0:0.01:2*pi
    x0 = 0:0.01:x;
    r0 = cos(2.*x0).*sin(2.*x0);
    clf;
    h = polar(x0,r0);
    patch(get(h,'XData'),get(h,'YData'),'y');
    pause(0.033);
end
