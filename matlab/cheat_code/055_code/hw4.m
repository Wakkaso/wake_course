clf; clc; clear;
disp('HW04 Problem 4.1') 

syms a;
syms b;
syms c;
syms x;
s = -(b - (b^2 - 4*a*c + 4*a*x)^(1/2))/(2*a);
diff(s)
return

while 1
    n = input('input n: ');
    if n==0
        difp('fuck')
        break
    end
    arr = input('input a, b, c: ');
    clf;
    a = arr(1);
    b = arr(2);
    c = arr(3);
    if (a<0&&b<0&&c<0)||(a>0&&b>0&&c>0)
    else
        disp('fuck')
        break;
    end
    y = rand(n,1);
    x = a.*y.^2+b.*y+c;
    m = mean(x);
    sd = std(x);
    xx = min(x):0.01:max(x);
    for i = max(x):-0.01:min(x)
        clf;
        h = histogram(x, 'Normalization', 'pdf');
        hold on;
        t1 = sprintf('M=%f; SD=%f; a=%f; b=%f; c=%f;',m,sd,a,b,c);
        title(t1);
        %s = solve(x == a*y^2+b*y+c, y)
        %->s = -(b - (b^2 - 4*a*c + 4*a*x)^(1/2))/(2*a);
        %diff(s)
        %->s = 1./(b^2-4*a*c+4.*a.*x).^(1/2);
        
        f = 1./(b^2-4*a*c+4.*a.*xx).^(1/2);
        plot(xx, f, 'linewidth', 3);
        plot(i, 1./(b^2-4*a*c+4.*a.*i).^(1/2),'.', 'Markersize', 20);
        pause(0.003);
    end
end