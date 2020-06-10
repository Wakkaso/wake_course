

n = 1000; j = 1; r1 = 2.5; r2 = 3.5;
c = -1; sigma = 3;


y = @(x) gaussmf(x, [sigma, c]);
A = integral(y, 2.5, 3.5);

a = zeros(1, 1000);
b = zeros(1, 100000);
cc = zeros(1, 1000000);

while (j<=1000)
    x = r1 + (r2-r1)*rand(1);
    p  = gaussmf(x, [sigma, c])/A;
    r = x*p*(r2-r1);
    a(j) = r;
    j = j + 1;
end
j = 1;
while (j<=100000)
    x = r1 + (r2-r1)*rand(1);
    p  = gaussmf(x, [sigma, c])/A;
    r = x*p*(r2-r1);
    b(j) = r;
    j = j +1;
end
j=1;
while (j<=1000000)
    x = r1 + (r2-r1)*rand(1);
    p  = gaussmf(x, [sigma, c])/A;
    r = x*p*(r2-r1);
    cc(j) = r;
    j = j +1;
end

x0 = -9:0.01:7;
y0 = 2.718281828.^(-(x0+1).^2./18);
figure(1);
plot(x0, y0);
hold on;
x1 = 2.5:1/n:3.5;
y1 = 2.718281828.^(-(x1+1).^2./18);
x1 = [x1 r2];
y1 = [y1 0];
x1 = [x1 r1];
y1 = [y1 0];
fill(x1, y1, 'b');
axis([-10 8 0 1]);

t1 = sprintf("N=%d, Mean=%f, SD=%f", 1000, mean(a), std(a));
t2 = sprintf("N=%d, Mean=%f, SD=%f", 100000, mean(b), std(b));
t3 = sprintf("N=%d, Mean=%f, SD=%f", 1000000, mean(cc), std(cc));

title({t1, t2, t3});

