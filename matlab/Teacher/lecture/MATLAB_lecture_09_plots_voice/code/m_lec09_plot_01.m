clf
y = [-10:2:10];
x = 5;
plot(x,y)
plot(x,y,'o', 'linewidth', 5)
grid minor

clf
x = [-10:0.05:10];
y = [1./x;...
    10.*sin(x);...
    cos(x.^2)];
plot(x,y);

clf
x = [-10:0.05:10];
y = 1./x;
x0 = 1;
plot(x,y,'.');
hold on
plot(x0,y, 'o');

clf
x = [-10:0.05:10];
y = sqrt(x);
plot(x,y);
x0 = 5; y0 = sqrt(x0);
hold on, 
plot(x0,y0,'+', 'LineWidth', 3);
s = sprintf('x=%2.0f, y=%2.1f',x0, y0);
text(x0+0.3, y0, ...
    s, 'FontSize',16);
set(gca,'FontSize',15);
axis([-12 12 0 3.5]);

clf
for a = [ 1 2 4]
x = [-10:0.05:10];
y = a.*sin(x);
plot(x,y);
hold on
end

%%%%%%%%%%%
clf
x = [-10:0.05:10];
y1 = 1./x;
y2 = 10.*sin(x);
y3 = cos(x.^2);
plot(x,y1,'LineWidth',3);
hold on
plot(x,y2,'LineWidth',3);
hold on
plot(x,y3,'LineWidth',3);
hold off
axis( [-8  8  -20  20] );
