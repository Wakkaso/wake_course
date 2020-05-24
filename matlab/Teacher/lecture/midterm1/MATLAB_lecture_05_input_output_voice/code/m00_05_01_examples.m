%
%y1 = |x| - 1
%y2 = 1 + |x^2 - 1|
%x in [-10, 10]. The step size is 0.01.  
%

 clf
x = (-10:0.01:10);
y1 = abs(x) - 1;
y2 = 1 + abs(x.^2-1);
plot(x, y1,'LineWidth', 2);
hold on
plot(x, y2, 'LineWidth', 2);
