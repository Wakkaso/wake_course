clf; clear; clc;
disp('0716055 ¤ýÄ£¼w');

	a = input('Please input a:');
    dx = input('Please input step size dx:');
    if dx < 0  
        dx = input('Please input step size dx:');
    end
    
    x = -10:dx:10;
	y = (2.*x.^2+3.*exp(-x)-(100*a).*sin(5.*x))./(6.*x.^2-9.*x-42)-10;
    
    s = size(x);
    i = 1;
    sig = s(i)>=0;		% sign
    disp(sig);
    x1 = [];
    y1 = [];	
    c = 'b';
    while i <= s(2)
        sig0 = y(i) >= 0;
        if (sig0 == sig)
            x1 = [x1, x(i)];
            y1 = [y1, y(i)];
            i = i+1;
        else
            plot(x1,y1, c, 'linewidth', 3);
            hold on;
            axis([-10 10 -100 100]);
            sig = sig0;
            if c == 'b'
                c = 'r';
            else
                c = 'b';
            end
            x1 = [];
            y1 = [];
            i = i+1;
        end
    end
    plot(x1,y1, c, 'linewidth', 3);
