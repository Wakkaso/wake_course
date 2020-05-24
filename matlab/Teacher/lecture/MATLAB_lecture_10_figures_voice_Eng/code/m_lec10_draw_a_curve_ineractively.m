clear;close all;

X = 0:0.01:pi*2;
h1 = figure
input('Press ENTER to start.');

x = zeros(size(X));
r = zeros(size(X));
i = 1;
for x0 = X   
    clf
    r0 = sin(x0);
    x(i) = x0; 
    r(i) = r0; 
    polarplot(x(1:i),r(1:i));
    hold on
    
    polarscatter(x0,r0,'filled','k');
    pause(0.033);
    i = i + 1;
end
hold off;