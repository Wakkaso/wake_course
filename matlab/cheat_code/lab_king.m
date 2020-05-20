clf; clear; clc;

disp('problem 1.1');
%{

x = 0:0.05:2*pi;
x0 = [];
for i = x
    clf;
    x0 = [x0 i];
    y1 = sin(x0);
    y2 = cos(2*x0);
    plot(x0, y1, 'linewidth', 3);
    hold on;
    plot(x0, y2, 'linewidth', 3);
    hold on;
    x1 = [x0 fliplr(x0)];
    yy = [y1 fliplr(y2)];
    fill(x1, yy, 'y');
    title('y1(x) = sin(x) and y2 = cos(2x).');
    legend({'y1(x)', 'y2(x)', 'region'});
    xlabel('x');
    ylabel('y');
    axis([0 2*pi -1 1]);
    pause(0.033);
end

%}

%{
great solution
c = 1; sigma = 2; r1 = 4; r2 = 6;
y = str2sym('2.718281828^(-(x-1)^2/8)');
A = int(y,¡¦x¡¦, 4, 6);

n = 10000; j = 1; r1 = 4; r2 = 6;
while (j<=n)
    x = r1 + (r2-r1)*rand(1);
    c = 1; sigma = 2;
    p  = gaussmf(x, [sigma, c])/A;
    r = x*p*(r2-r1);
    a(j) = r;
    j = j +1;
end
mean(a)


%}

n = 1000; j = 1; r1 = 2.5; r2 = 3.5;
c = -1; sigma = 3;
y = str2sym('2.718281828^(-(x+1)^2/18)');
A = int(y,'x', r1, r2);


a = zeros(1, n);

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

j = 1;
a = [];
b = [];
c = [];
tic
while j <= 1000
    t = normrnd(-1,3);
    if t>=2.5 && t<=3.5
        a = [a t];
        j = j+1;
    end
end
j = 1;
while j <= 100000
    t = normrnd(-1,3);
    if t>=2.5 && t<=3.5
        b = [b t];
        j = j+1;
    end
end
j = 1;
while j <= 1000000
    t = normrnd(-1,3);
    if t>=2.5 && t<=3.5
        c = [c t];
        j = j+1;
    end
end
toc
m1 = mean(a);
m2 = mean(b);
m3 = mean(c);

s1 = std(a);
s2 = std(b);
s3 = std(c);

t1 = sprintf('n=1000; mean=%f; SD: %f;',m1,s1);
t2 = sprintf('n=100000; mean=%f; SD: %f;',m2,s2);
t3 = sprintf('n=1000000; mean=%f; SD: %f;',m3,s3);

title({t1; t2; t3});
        







