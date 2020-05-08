clear; close all;
count = 0; maxCount = 10000;

xmin = -20; xmax = 20; ymin = -20; ymax = 20;
cx = 10; cy = 10; % center
r = 20; % radius
x = zeros(1, maxCount); y = zeros(1, maxCount);
while count < maxCount
    
    angle = rand(1)*2*pi;
    r0 = r*rand(1);
    
    x0 = r0*cos(angle) + cx;
    y0 = r0*sin(angle) + cy;
    
    
    count = count + 1;
    x(count) = x0;
    y(count) = y0;
end

plot(x,y,'o','Color','b');
set(gca,'fontsize', 30);