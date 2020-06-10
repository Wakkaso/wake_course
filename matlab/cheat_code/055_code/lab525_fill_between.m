clf; clear; clc;

disp('problem 1.1');

x = 0:0.05:2*pi;
x0 = [];
for i = x
    clf;
    x0 = [x0 i];
    y1 = sin(x0);
    y2 = cos(2*x0);
    plot(x0, y1, 'linewidth', 3);
    hold on;
    plot(x0, y2, 'linewidth', 3);
    hold on;
    x1 = [x0 fliplr(x0)];
    yy = [y1 fliplr(y2)];
    fill(x1, yy, 'y');
    title('y1(x) = sin(x) and y2 = cos(2x).');
    legend({'y1(x)', 'y2(x)', 'region'});
    xlabel('x');
    ylabel('y');
    text(i+0.1, y1(end), 'y1=(x)', 'FontSize',16);
    text(i+0.1, y2(end), 'y2=(x)', 'FontSize',16);
    axis([0 2*pi -1 1]);
    pause(0.033);
end
