x = -10:0.05:10
y = x.^2 - 5

% plot samples which satisfy the following conditions
% x inside [-5, 5]
% y > 3

index_x = find((-5 <=x) & (x <= 5))

xx = x(index_x);
yy = xx.^2 - 5
index_y = find(yn>3);

plot(xx(index_y), yy(index_y),'o')

% plot samples which satisfy the following conditions
% x inside [-10, -6], [-3, 0], [2, 5], [7, 10]
% -5 <= y <= 5

x = -10:0.0001:10;
y = 3.*x.*sin(x.^2);
index_x = find( ...
    ((-10 <= x) & (x <= -6))...
    |((-3 <= x) & (x <= 0))...
    |((2 <= x) & (x <= 5))...
    |((7 <= x) & (x <= 10))...
    );
xx = x(index_x);
yy = 3*xx.*sin(xx.^2) 
index_y = find((-5<=yy)&(yy<=5));

plot(xx(index_y), yy(index_y),'o')