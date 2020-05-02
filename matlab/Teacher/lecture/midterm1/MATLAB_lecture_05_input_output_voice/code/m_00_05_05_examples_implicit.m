%Plot an implicit function
% x^2 + 3xy  - 10y^2 = 0 
%
% (x+5y)(x-2y) = 0 
% 
% x = -5y or x = 2y.
%
y = [-10:0.01:10];
x = zeros(size(y));
clf
x1 = -5.*y;
plot(x1,y, 'LineWidth',3);
hold on
x2 = 2.*y;
plot(x2,y, 'LineWidth',3);
hold off

