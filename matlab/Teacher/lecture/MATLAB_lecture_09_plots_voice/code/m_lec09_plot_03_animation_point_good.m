close all; clf; clear;
clf;
hold on;
ymin = 0; ymax = 0;
msg = []; i = 1; A = [ 1 2 4];
color= ['r' 'g' 'b'];
set(gca,'FontSize',15);
axis([ -10 10 -4.5 4.5]);

x = [-10:0.05:10];

sx = size(x);
y = zeros(3, sx(2));
for a = A
    y(i,:) = a.*sin(x);
    %plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));
    s = sprintf('\\alpha=%d',a);
    i = i + 1;
    msg = [msg;s];
end

hold on
for xpoint = [-10:0.05:10]
    
    i = 1;
    for a = A
        plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));
        i = i + 1;
    end
    i = 1;
    for a = A
        y0 = a.*sin(xpoint);
        plot(xpoint, y0, 'o', ...
            'MarkerSize', 10, ...
            'LineWidth', 5,...
            'color', color(i));
        i = i + 1;
    end
    
    legend(msg);
    for i = [1:3]
        %text(pi/2, A(i)+0.25, msg(i,:), 'FontSize',16)
        text(x(end)+0.2, y(i,end)+0.25, msg(i,:), 'FontSize',16)
    end
    xlabel('x', 'color', 'red');
    ylabel('y', 'color', 'blue');
    if (xpoint ~= -10)
        pause(0.033); clf; hold on;
        set(gca,'FontSize',15);
        axis([ -10 10 -4.5 4.5]);
    end
    if xpoint == -10 input('Press Enter to start...'); end
end
hold off
