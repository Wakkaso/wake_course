clf; clear; clc;
disp('0716055 ¤ýÄ£¼w');
while 1
	a = input('Please input a:');
    if a == 0
	   fprintf('Thanks for playering.\n');
	   break
    end
    dx = input('Please input step size dx:');
    if dx == 0
        dx = 0.05;
    end
    x = -10:dx:10;
	y = a.*abs(x)+sin(x);
	plot(x,y, 'linewidth', 3);
	hold on;
end
