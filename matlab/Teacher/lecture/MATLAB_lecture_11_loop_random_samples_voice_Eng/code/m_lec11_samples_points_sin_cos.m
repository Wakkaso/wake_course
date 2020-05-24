clear; close all;
count = 0; maxCount = 10000;

xmin = -10; xmax = 10; ymin = -1; ymax = 1;
cx = 10; cy = 10; % center
r = 20; % radius
x = zeros(1, maxCount); y = zeros(1, maxCount);
while count < maxCount
    
    while true
        x0 = rand(1);
        x0 = xmin + (xmax-xmin)*x0;
        y0 = rand(1);
        y0 = ymin + (ymax-ymin)*y0;
        
        y1 = 2*sin(x0);
        y2 = 2*cos(x0);
        
        if (  (y1 <= y0 && y0 <= y2)...
                || (y2 <= y0 && y0 <= y1))
            break;
        end
        
    end
    
    count = count + 1;
    x(count) = x0;
    y(count) = y0;
end

X = xmin:0.05:xmax;
Y1 = 2*sin(X);
Y2 = 2*cos(X);

plot(x,y,'.','Color','b');
hold on
plot(X, Y1, 'linewidth', 3);
plot(X, Y2, 'linewidth', 3);
set(gca,'fontsize', 30);

rectangle('Position',...
    [xmin ymin (xmax-xmin) (ymax-ymin) ], ...
    'linewidth', 5,...
    'edgecolor', 'k');