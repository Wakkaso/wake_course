close all; clear;clf
x0 = pi/4;
x1 = 7*pi/4;
x = x0:0.05:x1
y = 2*cos(x) + 1;
plot(x,y,'r', 'linewidth', 5);
hold on
y0 = y(1);
y1 = y(end);
x = [x x1 x0];
y = [y 0  0];

fill(x,y,'b');

x = x0:0.5:x1
y = 2*cos(x) + 1;
plot(x,y,'o', 'linewidth', 5);
set(gca, 'fontsize', 25);
legend('y(x)=2cos(x)+1');
xlabel('x');
ylabel('y(x)');
axis([0 2*pi -1.25 4.25]);