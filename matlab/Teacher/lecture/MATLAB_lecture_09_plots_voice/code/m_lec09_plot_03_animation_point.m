<<<<<<< HEAD
close all; clf; clear;
clf;
hold on;
ymin = 0; ymax = 0;
msg = []; i = 1; A = [ 1 2 4];
color= ['r' 'g' 'b'];
set(gca,'FontSize',15);
axis([ -10 10 -4.5 4.5]);
xlabel('x', 'color', 'red');
ylabel('y', 'color', 'blue');
x = [-10:0.05:10];

sx = size(x);
y = zeros(3, sx(2));
for a = A
    y(i,:) = a.*sin(x);
    plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));
    s = sprintf('\\alpha=%d',a);
    i = i + 1;
    msg = [msg;s];
end
legend(msg);
for i = [1:3]
    %text(pi/2, A(i)+0.25, msg(i,:), 'FontSize',16)
    text(x(end)+0.2, y(i,end)+0.25, msg(i,:), 'FontSize',16)
end
hold off

input('Press Enter to start...');


for xpoint = [-10:0.05:10]
    clf; hold on
    i = 1;
    for a = A
        y0 = a.*sin(xpoint);
        plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));
        
        plot(xpoint, y0, 'o', ...
            'MarkerSize', 10, ...
            'LineWidth', 5,...
            'color', color(i));
        i = i + 1;
    end
    
    pause(0.033);
end
hold off
=======
close all; clf; clear;
clf;
hold on;
ymin = 0; ymax = 0;
msg = []; i = 1; A = [ 1 2 4];
color= ['r' 'g' 'b'];
set(gca,'FontSize',15);
axis([ -10 10 -4.5 4.5]);
xlabel('x', 'color', 'red');
ylabel('y', 'color', 'blue');
x = [-10:0.05:10];

sx = size(x);
y = zeros(3, sx(2));
for a = A
    y(i,:) = a.*sin(x);
    plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));
    s = sprintf('\\alpha=%d',a);
    i = i + 1;
    msg = [msg;s];
end
legend(msg);
for i = [1:3]
    %text(pi/2, A(i)+0.25, msg(i,:), 'FontSize',16)
    text(x(end)+0.2, y(i,end)+0.25, msg(i,:), 'FontSize',16)
end
hold off

input('Press Enter to start...');


for xpoint = [-10:0.05:10]
    clf; hold on
    i = 1;
    for a = A
        y0 = a.*sin(xpoint);
        plot(x,y(i,:), 'LineWidth', 3, 'color', color(i));
        
        plot(xpoint, y0, 'o', ...
            'MarkerSize', 10, ...
            'LineWidth', 5,...
            'color', color(i));
        i = i + 1;
    end
    
    pause(0.033);
end
hold off
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
