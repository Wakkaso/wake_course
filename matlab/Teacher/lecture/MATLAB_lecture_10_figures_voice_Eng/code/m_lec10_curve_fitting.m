clear; clf; figure;
x = [0:5];
y = [25,20,17,16,10,5];
plot(x,y, 'Linewidth',3);
set(gca,'FontSize',15);

%y = a*x + b
a = (y(end)-y(1))/(x(end) - x(1));
b = x(1); y1 = a.*(x-x(1)) + y(1);
hold on; plot(x,y1, 'Linewidth',3);
%%%%%%
%p = polyfit(x,y,3);
p = polyfit(x,y,4);
y2 = polyval(p,x);
plot(x,y2, 'Linewidth',3, 'color','k');
legend({'Data' 'Linear' 'Polyfit'});

%
close all;
hold on
x = [-5:0.05:5];
y = sin(x);
plot(x,y, 'Linewidth',7);
p = polyfit(x,y,7);
y2 = polyval(p,x);
plot(x,y2, 'Linewidth',3, 'color','k');
legend({'Data' 'Polyfit'});
set(gca,'FontSize',15);
hold off

%%%
clear; close all; hold on;
dataX = [-10:0.05:10];
dataY = sin(dataX);
p = polyfit(dataX,dataY,7);

%Test data
x = [-10:0.05:10];
y = sin(x);
y2 = polyval(p,x);
plot(x,y, 'Linewidth',7);
plot(x,y2, 'Linewidth',3, 'color','k');
legend({'Data' 'Polyfit'});
set(gca,'FontSize',15); axis([-10 10 -2 2]);
hold off