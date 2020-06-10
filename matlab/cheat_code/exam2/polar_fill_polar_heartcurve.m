%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midterm Number: 2
% Problem number: 4
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: CS
% Date: 5/21
% National Chiao Tung University, Taiwan
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all; clf;clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Midterm Problem 2.1') 	% show Midterm Problem 2.x

disp('Student Name:TSAI YU CHENG ; Student ID: 0716074');

hold on;
a = 10;
a1 = 5; b1 = 15; t0 = 0:0.1:6*pi;
for x = -4*pi:0.1:pi*4
    clf;    
    x0 = -4*pi:0.1:x;
    r0 = a .* sin(x0) ./ x0;
    subplot(1,2,1);

    
    polar(x0,r0,'b');
    hold on;
    [x1,y1] = pol2cart(x0,r0);
    fill(x1,y1,'b');
    polar(x0,r0,'or');
    
    subplot(1,2,2);
    if(x>2*pi)
        tt = 6*pi;
    else
        tt = x+4*pi;
    end
    t = 0:0.1:tt;

    x1 = (a1+b1).*cos(t) - b1.*cos((a1./b1+1).*t);
    y1 = (a1+b1).*sin(t) - b1.*sin((a1./b1+1).*t);
    plot(x1,y1);
    fill(x1,y1,'y');
    axis([-40 40 -40 40]);
%     pbaspect([1 1 1]);
    pause(0.001);
end
