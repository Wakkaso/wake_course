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
p = [0 0];
v = [15 20];
dt = 0.02;
m=1;
g=2;
n=[0 -1];
while(1)
    d = input('Please input d( , ): ');
    if (d(1)<0||d(2)<0) 
        return;
    end
    if (d<=1) 
        break;
    end    
end

while (t<=2) 
    clf
    F = m*g*n;	% force. mg is the force magnitude. 
    a1 = F/m - d(1)*v;
    a2 = F/m - d(2)*v;  % acceleration,
    v1 = v + a1 *dt;				% velocity
    v2 = v + a2 *dt;

    p1 = p + v *dt ;			% position
    p2 = p + v *dt ;			% position
    t = t + dt;				% time
    %viscircles([p(1) p(2)], 1, 'color', 'b');

    figure(1),plot(p1(1),p1(2));
    figure(2),plot(p2(1),p2(2));
    
    axis([0 400 -100 100]);
    % pause(0.05);
end


