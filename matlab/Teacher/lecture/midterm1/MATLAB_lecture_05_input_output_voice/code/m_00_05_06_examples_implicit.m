%Plot an implicit function
% x^2 + xy = 0
%
% => 
% x(x+y) = 0
% x = 0 or y = -x
%
x = [-10:0.01:10];
y = zeros(size(x));
clf
plot(x,y, 'LineWidth',3);
hold on
y = -x;
plot(x,y, 'LineWidth',3);
hold off

