clear;close all;

x = linspace(0, pi*2);
r = sin(x);
h1 = figure
polarplot(x,r);
input('Press ENTER to start.');
polarplot(x,r);

for x0 = x   
    clf
    hold on
    %polarplot(x,r);
    polar(x,r);
    
    r0 = sin(x0);
    %polarscatter(x0,r0,'filled', 'b');
    %polar(x0,r0,'filled', 'b');
    polar(x0,r0, 'o');
    pause(0.033);
    
end
hold off;
