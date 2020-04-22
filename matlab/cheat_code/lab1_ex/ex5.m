clf; clear; clc;
disp('0716055 ¤ıÄ£¼w');

while 1
    t = 0; v = [0  8]; p = [50  0];
    dt = 0.05; M = 10000; m = 1;
    d = input('input d: ');
    if d>1
        d = input('input d: ');
    end
    if d<0
        break;
    end
    clf;
    while t<=100
        
        axis([-10 50 -25 25]);
        plot(p(1), p(2), '.');
        hold on;
        
        f = -((p.*m.*M)./(norm(p).*(p*p')));
        a = f./m -d.*v;
        v = v+a.*dt;
        p = p+v.*dt;
        t = t+dt;
    end
end