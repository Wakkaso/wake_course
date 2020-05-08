tic
n = 10000;
j = 1; r1 = 4; r2 = 6;
while (j<=n)
    x = r1 + (r2-r1)*rand(1);
    c = 1; sigma = 2;
    p  = gaussmf( x, [sigma, c] );
    r = x*p*(r2-r1);
    a(j) = r;
    j = j +1;
end
y = sym('2.718281828^(-(x-1)^2/8)');
A = int(y,'x', 4, 6);
mean(a)/A;
toc

fprintf('Number of points:%d\n', n);
fprintf('Average:%f\n', mean(a)/A);
