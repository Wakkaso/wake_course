




a = input('input a: ');
if a == 0
    disp('Thanks for playing');
end
dx = 0.05;
dx = input('input dx: ');
while dx<0||dx>1
    dx = input('dx must be inside (0, 1]. ');
end

x = -10:dx:10;
y = abs(x)+a.*sin(x);
x0 = -10;
while x0<=10
    clf;
    plot(x, y, 'linewidth', 3);
    hold on;
    y0 = abs(x0)+a.*sin(x0);
    plot(x0, y0, 'o', 'color', 'r');
    grid on;
    axis([-10 10 -20 20]);
    x0 = x0+dx;
    pause(0.02);
end












