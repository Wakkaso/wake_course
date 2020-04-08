%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assignment Number: hw02
% Problem number: 2
% Student Name:  ¤ýÄ£¼w
% Student ID: 0716055
% Email address: bpploabc@gmail.com
% Department: Computer Science, NCTU
% Date: 2020/03/30 Mon.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clf; clear; clc;
fprintf('Problem 2.2\n');
fprintf('Student ID:0716055 Name:¤ýÄ£¼w\n');
x = [-10:0.05:10];
while 1
	v = input('Please input the range of a, [aMin, aMax]:');
    aMin = v(1);
    aMax = v(2);
    da = input('Please input the step size of a, da:');
    if da == 0
        fprintf('Thanks for playing.\n');
        break
    end
    clf;
    for a=(aMin:da:aMax)
        y = abs(sin(a.*x).*cos(x));
        plot(x,y,'LineWidth',2);
        hold on;
    end
end