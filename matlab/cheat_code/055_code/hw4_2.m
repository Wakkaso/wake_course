%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: 4
% Problem number: 2
% Student Name:  TSAI YU CHENG
% Student ID: 0716074
% Email address: jacky950141@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/5/31
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all windows
% clear variables, and clear screen
close all; clf; clear; clc;
% show ???
disp('Problem 4.2');
x0 = input('Input x0 in [0, 10]: ');
if(x0==0)
    return;
end

x=0:0.01:10;

Y1 = sin(x);
Y2 = cos(2.*x);
Y3 = x.^2.*sin(x).*exp(-x+1);
Y4 = 4 - x./2;

f1= @(x) abs(sin(x));
f2= @(x) abs(cos(2.*x));
f3= @(x) abs(x.^2.*sin(x).*exp(-(x-1)));
f4= @(x) abs(4-x./2);


area1 = integral(f1,0,x0);
area2 = integral(f2,0,x0);
area3 = integral(f3,0,x0);
area4 = integral(f4,0,x0);
area = [area1,area2,area3,area4];
area = sort(area);
order1 = find(area==area1);
order2 = find(area==area2);
order3 = find(area==area3);
order4 = find(area==area4);

for x1=x
    clf;
    subplot(2,2,1);
    plot(x,Y1);hold on;
    y1= sin(x1);
    plot([x1,x1],[y1,0]);
    xlim([0,10]);
    t1 = sprintf('(%d)y1 = sin(x); Area: %f',order1,area1);
    title(t1);
    
    subplot(2,2,2);
    plot(x,Y2);hold on;
    y2= cos(2.*x1);
    plot([x1,x1],[y2,0]);
    xlim([0,10]);
    t1 = sprintf('(%d)y2 = cos(2.*x); Area: %f',order2,area2);
    title({t1});
    
    subplot(2,2,3);
    plot(x,Y3);hold on;
    y3= x1.^2.*sin(x1).*exp(-(x1-1));
    plot([x1,x1],[y3,0]);
    xlim([0,10]);
    t1 = sprintf('(%d)y3 = x^2*sin(x)*exp(-x-1); Area: %f',order3,area3);
    title({t1});
    
    subplot(2,2,4);
    plot(x,Y4);hold on;
    y4= 4-x1./2;
    plot([x1,x1],[y4,0]);
    xlim([0,10]);
    t1 = sprintf('(%d)y4 = 4 - x/2; Area: %f',order4,area4);
    title({t1});
    
    pause(0.025);
end
