clear all; clc; clf;
x = 0:4;
y = [2.17096 1.08548 0.542741 0.27137 0.135685];
block = {'16'; '32'; '64'; '128' ;'256'};
subplot(1,2,1);
plot(x, y, 'linewidth', 3);
hold on;
plot(x, y, '.', 'markersize', 25);
hold on;
for i = 1:5
    t = sprintf("%f",y(i));
    text(x(i),y(i)+0.1,t+"%",'fontsize',15);
    text(x(i),-0.05,block(i,:));
    
end
set(gca,'xtick',[],'fontsize',15);
title('ICACHE');
xlabel('Block size','position', [2 -0.1]);
ylabel('Miss rate');
ylim([0 7]);


subplot(1,2,2);
y = [5.55556 3.1746 1.5873 0.793651 0.793651];
plot(x, y, 'linewidth', 3);
hold on;
plot(x, y, '.', 'markersize', 25);
hold on;
for i = 1:5
    t = sprintf("%f",y(i));
    text(x(i),y(i)+0.1,t+"%",'fontsize',15);
    text(x(i),-0.05,block(i,:));
    
end
set(gca,'xtick',[],'fontsize',15);
title('DCACHE');
xlabel('Block size','position', [2 -0.1]);
ylabel('Miss rate');
ylim([0 7]);

