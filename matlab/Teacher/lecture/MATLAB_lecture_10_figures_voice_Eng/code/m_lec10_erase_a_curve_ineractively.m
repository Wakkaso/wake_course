clear;close all;

x = 0:0.01:pi;
r = sin(x);
h1 = figure
polarplot(x(1:end),r(1:end), ...
    'LineWidth', 3, 'color', 'b');
hold on
ps = polarscatter(0,0,'filled','k');

input('Press ENTER to start.');

i = 1;
for x0 = x   
    clf
    r0 = sin(x0); 
    polarplot(x(i:end),r(i:end));
    hold on
    
    polarscatter(x0,r0,'filled','k');
    pause(0.033);
    i = i + 1;
end
hold off;