clear; close all;
count = 0; maxCount = 200000;

xmin = -10; xmax = 10; ymin = -10; ymax = 10;
x = zeros(1, maxCount); y = zeros(1, maxCount);
while count < maxCount
    while true
        x0 = rand(1);
        x0 = xmin + ( xmax - xmin )*x0;
        if (xmin <= x0 && x0 <= xmax)
             break;
        end
    end
    while true
        y0 = rand(1);
        y0 = ymin + ( ymax - ymin )*y0;
        if (ymin <= y0 && y0 <= ymax)
             break;
        end
    end
    
    
    count = count + 1;
    x(count) = x0;
    y(count) = y0;
end

plot(x,y,'o','Color','b');