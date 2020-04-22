clf; clear; clc;
disp('0716055 ¤ýÄ£¼w');
while 1
	b = input('Please input b:');
    if b == 0
	   fprintf('Thanks for playering.\n');
	   break
    end
    clf;
    x1 = [];
    x2 = [];
    m = -10:0.05:10;
    for y = m
        k = 4.*y.^2 + 4.*b.*y.^2.*(abs(sin(y))+1);
        if k<0
        elseif k == 0
            x1 = [x1, 2.*y./(2.*(abs(sin(y))+1))];
            x2 = [x2, 2.*y./(2.*(abs(sin(y))+1))];
        else
            x1 = [x1, (2.*y+sqrt(k))./(2.*(abs(sin(y))+1))];
            x2 = [x2, (2.*y-sqrt(k))./(2.*(abs(sin(y))+1))];
        end
    end
    plot(x1, m, 'linewidth', 3);
    hold on;
    plot(x2, m, 'linewidth', 3);
    hold on;
end
