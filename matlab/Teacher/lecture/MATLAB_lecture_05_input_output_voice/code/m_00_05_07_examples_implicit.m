%Plot an implicit function
% (x^2+1)y^2 + y sin x - x^2 = 0
%
%
x = [-10:0.01:10];
clf
a = x.^2+1;
b = sin(x);
c = -x.^2;
y1 = (-b-sqrt(b.^2 - 4.*a.*c))./(2.*a);
y2 = (-b+sqrt(b.^2 - 4.*a.*c))./(2.*a);
plot(x,y1, 'LineWidth',3);
hold on
plot(x,y2, 'LineWidth',3);
hold off

y = y1

(x.^2+1).*y.^2 + y .*sin(x) - x.^2