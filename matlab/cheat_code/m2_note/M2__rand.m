
% % tic toc 
% clear; close all;
% tic
% c = 0; N = 200000;
% n = zeros(1, N);
% while c < N
%     x = 0;
%     while ~((0.5<=x && x<=0.8) ||... 
%         (0.2<=x && x<=0.4) )
%     x = rand(1);
%     end
%     c = c + 1;
%     n(c) = x;
% end
% toc

% % rand
% clear; close all;
% count = 0; maxCount = 2000;
% xmin = -10; xmax = 10; 
% ymin = -10; ymax = 10;
% x = zeros(1, maxCount); y = zeros(1, maxCount);
% while count < maxCount
%     while true
%         x0 = rand(1); x0 = xmin + ( xmax - xmin )*x0;
%         if (xmin <= x0 && x0 <= xmax)
%              break;
%         end
%     end
%     while true
%         y0 = rand(1); y0 = ymin + ( ymax - ymin )*y0;
%         if (ymin <= y0 && y0 <= ymax)
%              break;
%         end
%     end
%     count = count + 1;
%     x(count) = x0; y(count) = y0;
% end 
% plot(x,y,'o','Color','b');

% % rand circle
% clear; close all;
% count = 0; maxCount = 10000;
% xmin = -20; xmax = 20; ymin = -20; ymax = 20;
% cx = 10; cy = 10; % center
% r = 20; % radius
% x = zeros(1, maxCount); y = zeros(1, maxCount);
% while count < maxCount
%     while true
%         x0 = rand(1);
%         x0 = xmin + ( xmax - xmin )*x0+cx;
%         y0 = rand(1);
%         y0 = ymin + ( ymax - ymin )*y0+cy;
%         dx = x0 - cx;
%         dy = y0 - cy;
%         dxy = [dx dy];
%         if (dxy * dxy' <= r*r) 
%             break;
%         end
%     end
%     count = count + 1;
%     x(count) = x0; y(count) = y0;
% end
% plot(x,y,'o','Color','b');
% set(gca,'fontsize', 30);




% % rand sin cos range
% clear; close all;
% count = 0; maxCount = 10000;
% xmin = -10; xmax = 10; ymin = -1; ymax = 1;
% x = zeros(1, maxCount); y = zeros(1, maxCount);
% while count < maxCount
%     
%     while true
%         x0 = rand(1);
%         x0 = xmin + (xmax-xmin)*x0;
%         y0 = rand(1);
%         y0 = ymin + (ymax-ymin)*y0;
%         y1 = 2*sin(x0); y2 = 2*cos(x0);  
%         if (  (y1 <= y0 && y0 <= y2)...
%             || (y2 <= y0 && y0 <= y1))
%             break;
%         end     
%     end
%     
%     count = count + 1;
%     x(count) = x0;
%     y(count) = y0;
% end
% plot(x,y,'.','Color','b');
% hold on
% 
% X = xmin:0.05:xmax;
% Y1 = 2*sin(X);
% Y2 = 2*cos(X);
% plot(X, Y1, 'linewidth', 3);
% plot(X, Y2, 'linewidth', 3);
% set(gca,'fontsize', 30);


% % axis equal
% pbaspect([1 1 1])