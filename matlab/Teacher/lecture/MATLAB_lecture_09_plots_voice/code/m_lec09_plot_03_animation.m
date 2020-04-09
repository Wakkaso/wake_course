<<<<<<< HEAD
close all; clf; clear;
input('Press Enter to start...');
for xUpper = [-10:0.25:10] 
    clf;
    hold on;
    ymin = 0; ymax = 0;
    msg = []; i = 1; A = [ 1 2 4];    
    color= ['r' 'g' 'b'];
    
    
    x = [-10:0.05:xUpper];
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
        text(x(end), y(i,end)+0.25, msg(i,:), 'FontSize',16)
    end
    hold off
    set(gca,'FontSize',15);
    axis([ -10 10 -4.5 4.5]);
    xlabel('x', 'color', 'red');
    ylabel('y', 'color', 'blue');
    pause(0.033);
end
=======
close all; clf; clear;
input('Press Enter to start...');
for xUpper = [-10:0.25:10] 
    clf;
    hold on;
    ymin = 0; ymax = 0;
    msg = []; i = 1; A = [ 1 2 4];    
    color= ['r' 'g' 'b'];
    
    
    x = [-10:0.05:xUpper];
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
        text(x(end), y(i,end)+0.25, msg(i,:), 'FontSize',16)
    end
    hold off
    set(gca,'FontSize',15);
    axis([ -10 10 -4.5 4.5]);
    xlabel('x', 'color', 'red');
    ylabel('y', 'color', 'blue');
    pause(0.033);
end
>>>>>>> 542a0a8303d7514c52d858d6ed680356c059c9eb
