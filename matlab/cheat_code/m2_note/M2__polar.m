% % #1. Demo: Polar plots
% clear;close all;clf;
% x = 0:0.01:pi*2;
% r = cos(2*x).*sin(2*x);
% polarplot(x,r);
% input('Press ENTER to start.');
% hold on;
% for x0 = x
%   r0 = cos(2*x0) .*  sin(2*x0);
%   polarplot(x0,r0,'o');
%   pause(0.033);
% end
% hold off;





% % #2. active spot on a circle
% x = linspace(0, pi*2); % 100 samples
% r = sin(x);
% h1 = figure;
% polarplot(x,r);
% input('Press ENTER to start.');
% polarplot(x,r);
%  
% for x0 = x   
%     clf		% clear figure content
%     % must draw a polar plot first before calling hold on;
%     polarplot(x,r);	    
%     hold on
%     r0 = sin(x0);
%     polarscatter(x0,r0,'filled', 'b');
%     pause(0.033);
% end
% hold off;





% % #3. Erase a curve interactively while tracing a point
% x = 0:0.01:pi; r = sin(x);
% h1 = figure
% polarplot(x(1:end),r(1:end), ...
%     'LineWidth', 3, 'color', 'b');
% hold on
% ps = polarscatter(0,0,'filled','k');
% input('Press ENTER to start.');
% 			% (x(1), r(1), ¡K
% i = 1;
% for x0 = x   
%     clf
%     r0 = sin(x0); 
%     polarplot(x(i:end),r(i:end));
%     hold on
%     
%     polarscatter(x0,r0,'filled','k');
%     pause(0.033);
%     i = i + 1;
% end

% % fill()
% figure
% x = 0:0.5:15
% y = x.^2/10+1;
% plot(x,y,x,y,'ro');
% hold on
%  
% x = 5:0.5:10;
% y = x.^2/10+1;
% x = [x,10];
% y = [y,0];
% x = [x,5];
% y = [y,0];
% % fill(x,y,'b');
% C = 1:13;		%color index
% fill(x,y,C);

% % fill a sin(x) with legend, label
% clear;close all;clf;
% x = 0:0.05:(2*pi);
% y = sin(x);
% plot(x,y,'r', 'linewidth', 5);
% hold on
% x = [x 2*pi 0]
% y = [y 0    0]
% 
% fill(x,y,'b');
% % x = 0:0.5:(2*pi)
% % y = sin(x);
% plot(x,y,'o', ...
%    'linewidth', 5);
% set(gca, 'fontsize', 25);
% legend('y(x)=sin(x)');
% xlabel('x');
% ylabel('y(x)');

% % log plot
% x = 0:0.1:20;
% y = exp(x); subplot(2,2,1);
% plot(x,y);
% subplot(2,2,2);
% semilogx(x,y);
% subplot(2,2,3);
% semilogy(x,y);
% subplot(2,2,4);
% loglog(x,y);
 


% % Bar chart

% clear; clf;
% figure;
% x = [4 3 2 1 7 8 9;...
%      1 2 3 4 5 6 7
% ];
% bar(x);
% 
% figure;
% x = [1:2:20];
% y = [7:7:70];
% bar(x,y,'FaceColor',...
%    [0.3010 0.7450 0.9330]);
%
% figure;
% x = [4 3 2 1 7 8 9;...
%      1 2 3 4 5 6 7
% ];
% bar(x,'stacked');

% % Bar Graph with Categorical Data
% figure;
% c = categorical({'Jan','Feb','Mar', 'Apr', 'May', 'Jun', 'Jul'}); 
% x = [4 3 2 1 7 8 9 ...
%     ];
% % c = categorical(list,list);
% % bar(c,x);
% bar(c,x,'stacked');
% set(gca,'FontSize',15);

% % pie
% clear; clf;
% figure;
% x = [1 2 3];
% pie(x);
% set(gca,'FontSize',15);


% Linear approximation
% clear; clf;
% figure;
% x = [0:5]
% y = [25,20,17,16,10,5]
% plot(x,y, 'Linewidth',3);
% set(gca,'FontSize',15);
 
% %y = a*x + b
% a = (y(end)-y(1))/(x(end) - x(1));	% slope
% %b = ???; // do not need to explicitly evaluate b
% y1 = a.*(x-x(1)) + y(1);
% hold on
% plot(x,y1, 'Linewidth',3);
% %%%%% polyfit min-square
% p = polyfit(x,y,4);
% y2 = polyval(p,x);
% plot(x,y2, 'Linewidth',3, 'color','k');
% legend({'Data' 'Linear' 'Polyfit'});

% % polyfit
% clear;close all; hold on;
% dataX = [-10:0.05:10];
% dataY = sin(dataX);
% p = polyfit(dataX,dataY,7);
% %Test data
% x = [-10:0.05:10];
% y = sin(x);
% y2 = polyval(p,x);
% plot(x,y, 'Linewidth',7);
% plot(x,y2, 'Linewidth',3, 'color','k');
% legend({'Data' 'Polyfit'});
% set(gca,'FontSize',15); axis([-10 10 -2 2]);
% hold off


