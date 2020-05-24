close all; clear; clf;
a = 0:0.05:2*pi;
r = 5;
x = r*cos(a);
y = r*sin(a);
plot(x,y,'linewidth', 3);
pbaspect([1 1 1]);