%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: Lab Two
% Problem number: ?
% Student Name:  ?
% Student ID: ?
% Email address: ?
% Department: Computer Science, NCTU
% Date: ?.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
%{
close all; clf; clear; clc;

% show Lab Two Example
disp('Lab Two Example')  

t = 0;
tmax = 100;

grid
a = [-0.5 -1.5];
p = [0 0];
v = [15 10];
dt = 0.05;
while true
    d = input('Please input d:');
    if (d<0) 
        return;
    end
    if (d<=1) 
        break;
    end    
end
figure
while (t<=tmax) 
    clf
    v = v + a*t - d*v;
    p = p + v*dt;
    t = t + dt;
    viscircles([p(1) p(2)], 1, 'color', 'b');
    axis([-100 100 -100 100]);
    pause(0.05);
end


close all; clf; clear; clc;
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Lab Problem 2.1')  

t = 0;

% grid

t = 0;
p1 = [0 0];
v1 = [15 20];
dt = 0.002;
m1 = 1;
g1 = 2;
n1 = [0 -1];

p2 = [0 0];
v2 = [15 20];
m2 = 1;
g2 = 2;
n2 = [0 -1];
while(1)
    d = input('Please input d( , ): ');
    if (d(1)<0||d(2)<0) 
        return;
    end
    if (d<=1) 
        break;
    end    
end
fig = p1;
fig2 = p2;
while (t<=2) 
    clf
    f = m1.*g1.*n1;
    a = f./m1 - d(1).*v1;
    v1 = v1 + a.*t;
    p1 = p1 + v1.*t;
    fig = [fig; p1];
    
    f2 = m2.*g2.*n2;
    a2 = f2./m2 - d(2).*v2;
    v2 = v2 + a2.*t;
    p2 = p2 + v2.*t;
    fig2 = [fig2; p2];
    
    t = t + dt;				% time
   
    clf;
    subplot(3,1,1);
    plot(fig(:,1), fig(:,2),'-');
    hold on;
    viscircles([p1(1) p1(2)], 1, 'color', 'b');
   % plot(p1(1), p1(2),'bo', 'linewidth', 3);
    grid on;
    axis([0 400 -100 100]);

    subplot(3,1,2);
    plot(fig2(:,1), fig2(:,2),'-');
    hold on;
    viscircles([p2(1) p2(2)], 1, 'color', 'b');
    grid on;
    axis([0 400 -100 100]);
    
    subplot(3,1,3);
    plot(fig2(:,1), fig2(:,2),'-');
    hold on;
    viscircles([p2(1) p2(2)], 1, 'color', 'b');
    grid on;
    axis([0 400 -100 100]);
    pause(dt);
end


