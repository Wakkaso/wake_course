close all; clear;clf
x = 0:0.05:(2*pi)
y = sin(x) + 1;
plot(x,y,'r', 'linewidth', 5);
hold on
x = [x 2*pi 0]
y = [y 0    0]
fill(x,y,'b');
x = 0:0.5:(2*pi) 
y = sin(x) + 1;
plot(x,y,'o', 'linewidth', 5);
set(gca, 'fontsize', 25);
legend('y(x)=sin(x)+1');
xlabel('x');
ylabel('y(x)');