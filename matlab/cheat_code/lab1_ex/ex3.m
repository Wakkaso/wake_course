clf; clear; clc;
disp('0716055 ¤ýÄ£¼w');
while 1
    m = input('Please input m:');
    while ~(m==0 ||m==1 ||m==2 ||m==3 ||m==4 ||m==5 ||m==6 ||m==7 ||m==8 ||m==9 ||m==10 ) 
        m = input('Please input m:');
    end
 
    if m == 0
	   fprintf('Thanks for playering.\n');
	   break
    end
    clf;
    x = [0:0.01:10];
    y1 = cos(x);
    y2 = zeros(size(x));
    for i = [0:m]
        y2 = y2+(-1).^i./factorial(2.*i).*x.^(2.*i);
    end
	plot(x,y1, 'linewidth', 4);
	hold on;
	plot(x,y2, 'linewidth', 2);
end
