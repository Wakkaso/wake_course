clear; close all;
count = 0; maxCount = 10000;

xmin = -20; xmax = 20; ymin = -20; ymax = 20;
cx = 10; cy = 10; % center
r = 20; % radius
x = zeros(1, maxCount); y = zeros(1, maxCount);
while count < maxCount
    while true
        x0 = rand(1);
        x0 = xmin + ( xmax - xmin )*x0+cx;
        y0 = rand(1);
        y0 = ymin + ( ymax - ymin )*y0+cy;
        dx = x0 - cx;
        dy = y0 - cy;
        dxy = [dx dy];
        if (dxy * dxy' <= r*r) 
            break;
        end
    end
    
    count = count + 1;
    x(count) = x0;
    y(count) = y0;
end

plot(x,y,'o','Color','b');
set(gca,'fontsize', 30);