%
% y = a e^(-(x-b)^2/(2c^2))
% a = 1, b = 0. c = 1;
% a = 1, b = 0. c = 2;
% a = 1, b = 0. c = 3;
%x in [-10, 10]. The step size is 0.01.  
%
clf
x = [-10:0.01:10];
a = 1; b = 0; c  = 1;
y1 = a .* exp(-(x-b).^2./(2.*c.^2))
plot(x, y1,'Linewidth', 2);
a = 1; b = 0; c  = 2;
y2 = a .* exp(-(x-b).^2./(2.*c.^2))
hold on; plot(x, y2,'Linewidth', 2);
a = 1; b = 0; c  = 3;
y3 = a .* exp(-(x-b).^2./(2.*c.^2))
hold on; plot(x, y3, 'LineWidth', 2);


